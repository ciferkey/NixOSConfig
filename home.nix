{ config, lib, pkgs, ... }:
let
  # https://functor.tokyo/blog/2018-02-18-install-packages-from-nixos-unstable
  unstableTarball =
    fetchTarball
      https://github.com/NixOS/nixpkgs-channels/archive/nixos-unstable.tar.gz;
in
{
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "discord"
    "idea-ultimate"
    "vscode"
  ];

  nixpkgs.config = {
    packageOverrides = pkgs: {
      unstable = import unstableTarball {
        config = config.nixpkgs.config;
      };
    };
  };


  home.packages = with pkgs; [
    unstable.bundler
    unstable.bundix
    deluge
    discord
    firefox
    google-cloud-sdk
    insomnia
    irssi
    jdk11
    jetbrains.idea-ultimate
    mpv
    mullvad-vpn
    python3
    tilix
  ];

  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    extensions = with pkgs.vscode-extensions; [
      #Dedsec727.jekyll-run
      #ginfuru.ginfuru-vscode-jekyll-syntax
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "code-spell-checker";
        publisher = "streetsidesoftware";
        version = "1.10.2";
        sha256 = "1ll046rf5dyc7294nbxqk5ya56g2bzqnmxyciqpz2w5x7j75rjib";
      }
   ];
    userSettings = {
    };
  };

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
      set nu
    '';
  };

}
