{ pkgs, ... }:

{
  home.packages = [
    #pkgs.firefox
    #pkgs.vim
  ];

  programs.git = {
    enable = true;
    userName  = "ciferkey";
    userEmail = "ciferkey@gmail.com";
  };

  programs.home-manager = {
    enable = true;
    path = "…";
  };
}
