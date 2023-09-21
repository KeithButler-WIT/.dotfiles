{ config, lib, pkgs, ... }:

{
  programs.gh.enable = true;
  programs.git = {
    enable = true;
    package = pkgs.git;
    extraConfig = {
      user = {
        useConfigOnly = true;
        name = "Keith Butler";
        email= "keithbutler2001@gmail.com";
        signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEY68QkXxmwNqWTBiPOgiB6XVFRaycRWVqmJXAK/No9S 20089137@mail.wit.ie";
      };

      init.defaultBranch = "main";

      credential.helper= "/usr/bin/git-credential-manager";
      credential.credentialStore = "gpg";

      safe.directory = "/opt/flutter";

      gpg.format = "ssh";

      # Fixed a fatal error of url hanging
      http.postBuffer = 2147483648;
      http.lowSpeedLimit = 0;
      http.lowSpeedTime = 999999;
    };
    lfs.enable = true;
    aliases = {
      # identify = "! git-identify";
      # id = "! git-identify";
      co = "checkout";
    };
  };
}
