{ pkgs, ... }: {
  system.primaryUser = "noel";
  nixpkgs.hostPlatform = "aarch64-darwin";
  nix.enable = false; # Deterministic daemon compatibility
  users.users.noel.home = "/Users/noel";

  # Touch ID for terminal
  security.pam.services.sudo_local.touchIdAuth = true;

  # macOS GUI settings
  system.defaults = {
    finder.AppleShowAllExtensions = true;
    dock.show-recents=true;
    CustomUserPreferences = {
      "com.apple.dock" = {
        show-recent-count = 10;
      };
    };
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
      "google-chrome"
      "google-drive"
      "1password"
      "chatgpt"
    ];
  };

  system.stateVersion = 5;
}
