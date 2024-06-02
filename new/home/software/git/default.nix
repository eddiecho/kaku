{
  pkgs,
  config,
  ...
} : {
  home.sessionVariables.DELTA_PAGER = "less -R";

  programs.git - {
    enable = true;
    userName = "Eddie Cho";
    userEmail = "eunseocho@gmail.com";

    delta = {
      enable = true;
    };

    extraConfig = {
      init.defaultBranch = "main";
      merge.conflictStyle = "diff3";
      push.autoSetupRemote = true;
      core.editor = "nvim";
    };
  };
}
