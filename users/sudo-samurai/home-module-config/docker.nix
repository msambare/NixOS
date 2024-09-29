{ config, pkgs, ... }:
{
  services.docker = {
    enable = true;  # Enable Docker as a user service
    package = pkgs.docker_27;  # Ensure you're using Docker 27
    useRootless = true;  # Optional: Use rootless Docker (more secure)
  };
}
