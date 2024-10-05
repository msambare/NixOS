{ pkgs, lib, config, username, ... }: {

    options = {
        atuin.enable = lib.mkEnableOption "enables atuin";
    };

    config = lib.mkIf config.atuin.enable  {
        programs.atuin = {
            enable = true;
            settings = {
              # Uncomment this to use your instance
              # sync_address = "https://majiy00-shell.fly.dev";
            };
        };
    };
}
