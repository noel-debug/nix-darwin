{ pkgs, ... }: {
  system.primaryUser = "noel";
  nixpkgs.hostPlatform = "aarch64-darwin";
  nix.enable = false; # Deterministic daemon compatibility

  # Touch ID for terminal
  security.pam.services.sudo_local.touchIdAuth = true;

  # macOS GUI settings
  system.defaults = {
    finder.AppleShowAllExtensions = true;
  };

  # macOS GUI Applications
  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";
    casks = [
      "ghostty"
      "zcode"
      "visual-studio-code"
      "spotify"
    ];
  };

  system.stateVersion = 5;
}
