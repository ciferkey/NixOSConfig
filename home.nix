{ lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "discord"
    "idea-ultimate"
  ];

  home.packages = with pkgs; [
    deluge
    discord
    dos2unix
    firefox
    google-cloud-sdk
    jdk11
    jetbrains.idea-ultimate
    mpv
    mullvad-vpn
    python3
    tilix
  ];

  programs.git = {
    enable = true;
    userName  = "ciferkey";
    userEmail = "ciferkey@gmail.com";
    extraConfig = {
      core = {
        autocrlf = true;
      };
    };
  };

  programs.home-manager = {
    enable = true;
    path = "…";
  };

  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [ ];
    settings = { ignorecase = true; };
    extraConfig = ''
      set mouse=a
    '';
  };

}
