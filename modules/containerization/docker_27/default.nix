{ pkgs, lib, config, username, ... }: {

    options = {
        docker_27.enable = lib.mkEnableOption "enables docker_27";
    };

    config = lib.mkIf config.docker_27.enable  {
        services.docker = {
            enable = true;
            package = pkgs.docker_27;  # You can specify this or omit it to use the default Docker version.
            extraOptions = "--experimental";  # Optional: Add any extra options you want Docker to run with.
        };
    };
}
