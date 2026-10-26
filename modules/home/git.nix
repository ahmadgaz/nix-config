{ ... }:
{
  programs.git = {
    settings = {
      init.defaultBranch = "main";
      pull.rebase = true;
      alias = {
        st = "status";
        co = "checkout";
      };
    };
  };

}
