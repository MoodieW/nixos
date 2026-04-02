# Main PC specific configuration
{ config, pkgs, ... }:

{
  imports = [
    ../../shared-configuration.nix
    ./hardware-configuration.nix
  ];

  # Hostname
  networking.hostName = "main-pc";

  # Nvidia configuration
  hardware.opengl = {
    enable = true;
  };
  hardware.nvidia.open = true;
  hardware.nvidia.modesetting.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
}
