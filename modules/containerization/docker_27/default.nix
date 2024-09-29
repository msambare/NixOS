{ pkgs, lib, config, username, ... }: {

    options = {
        docker_27.enable = lib.mkEnableOption "enables docker_27";
    };

    config = lib.mkIf config.docker_27.enable  {
        environment.systemPackages = [
            pkgs.docker_27
        ];
    };
}
