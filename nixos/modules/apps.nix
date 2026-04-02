{ pkgs, ... }:

{
  
  
  environment.systemPackages = with pkgs; [
    obsidian
    rofi
    sxhkd
    vesktop
  ];
}
