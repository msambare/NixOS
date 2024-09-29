{ pkgs, lib, config, username, ... }: {

    options = {
        docker_27.enable = lib.mkEnableOption "enables docker_27";
    };

    config = lib.mkIf config.docker_27.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ docker_27 
                shadow  # for newuidmap and newgidmap
                slirp4netns  # for user-mode networking
                fuse-overlayfs  # for rootless overlay filesystem support
            ];
        };    
    };
}
