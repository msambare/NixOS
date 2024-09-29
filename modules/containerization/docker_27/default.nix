{ pkgs, lib, config, username, ... }: {

    options = {
        docker_27.enable = lib.mkEnableOption "enables docker_27";
    };

    config = lib.mkIf config.docker_27.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ docker_27 ];
        };

    services.docker = {
    enable = true;  # Enable Docker as a user service
    #package = pkgs.docker_27;  # Ensure you're using Docker 27
    useRootless = true;  # Optional: Use rootless Docker (more secure)
  };    
    };
}
