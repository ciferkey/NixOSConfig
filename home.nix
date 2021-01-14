{ pkgs, ... }:

{
  home.packages = with pkgs; [
    firefox
    tilix
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

  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [ ];
    settings = { ignorecase = true; };
    extraConfig = ''
      set mouse=a
    '';
  };

}
