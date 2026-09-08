{
  pkgs,
  nixos,
  nixos-hardware,
  ...
}:

{
  imports = [

    # Hardware
    ./hardware.nix

    # Hardware modules
    nixos-hardware.nixosModules.raspberry-pi-4

    # NixOS modules
    nixos.base.default
    nixos.hardware.default
    nixos.services.default
    nixos.users.default
  ];

  # Mainline kernel. nixos-hardware defaults to its own downstream RPi kernel
  # build, which no binary cache serves (NixOS/nixos-hardware#325), so every
  # update meant hours of compiling on the Pi. Mainline comes from
  # cache.nixos.org and its device tree already enables v3d/vc4.
  # Trade-off: no vcio, so vcgencmd / vcmailbox / rpi-eeprom-update do not work.
  boot.kernelPackages = pkgs.linuxPackages;

  # Firewall
  networking.firewall.allowedTCPPorts = [ ];
  networking.firewall.allowedUDPPorts = [ ];

  # Networking
  networking.useDHCP = false;
  networking.interfaces.end0 = {
    useDHCP = false;
    # wakeOnLan.enable = true;
    ipv4.addresses = [
      {
        address = "10.1.2.1";
        prefixLength = 8;
      }
    ];
  };
  networking.defaultGateway = "10.0.0.1";
  networking.nameservers = [ "10.0.0.1" ];

  # Hardware
  services.hardware.argonone = {
    enable = true;
    # argonone.dtbo targets &i2c_arm, a label that only exists in the
    # downstream device tree; the mainline DTB only has &i2c1.
    package = pkgs.argononed.overrideAttrs (old: {
      postPatch = old.postPatch + ''
        substituteInPlace src/argonone.dts --replace-fail "&i2c_arm" "&i2c1"
      '';
    });
  };
  hardware = {
    enableRedistributableFirmware = true;
    # GPU (VideoCore VI). The mainline device tree already enables v3d/vc4, so
    # only the Mesa userspace is needed: v3d for GL, v3dv for Vulkan (headless
    # compute works off /dev/dri/renderD128, no display required).
    graphics.enable = true;
    raspberry-pi."4".apply-overlays-dtmerge.enable = true;
    deviceTree = {
      enable = true;
      filter = "*rpi-4-*.dtb";
      # The mainline DTB has no i2c aliases, so adapter numbers follow probe
      # order and the Argon One controller lands on a moving /dev/i2c-N.
      # Pin the SoC i2c1 controller to /dev/i2c-1, argononed's default bus.
      overlays = [
        {
          name = "rpi4-i2c1-alias";
          dtsText = ''
            /dts-v1/;
            /plugin/;
            / {
              compatible = "brcm,bcm2711";
              fragment@0 {
                target-path = "/aliases";
                __overlay__ {
                  i2c1 = "/soc/i2c@7e804000";
                };
              };
            };
          '';
        }
      ];
    };
  };

  console.enable = true;

  # flashrom 1.8.0 fails its test suite on aarch64-linux (NixOS/nixpkgs#558302),
  # which breaks raspberrypi-eeprom below. tests/chip.c setup_bad_chip() keeps a
  # pointer to a stack-local mock_chip in flashctx->chip after returning; the
  # patch makes it static. Not fixed upstream yet — drop this once nixpkgs builds.
  nixpkgs.overlays = [
    (_: prev: {
      flashrom = prev.flashrom.overrideAttrs (old: {
        patches = (old.patches or [ ]) ++ [ ./flashrom-dangling-mock-chip.patch ];
      });
    })
  ];

  environment.systemPackages = with pkgs; [
    libraspberrypi
    raspberrypi-eeprom
    vulkan-tools # vulkaninfo
  ];
}
