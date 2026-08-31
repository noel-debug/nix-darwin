{ ... }:

{
  programs.ghostty = {
    enable = true;
    # Ghostty is already installed through nix-darwin
    # Homebrew cask configuration.
    package = null;
    settings = {
        command = "bash -c -l nu";
        font-family = "JetBrainsMono Nerd Font";
        background-opacity = 0.95;
        background-blur = 20;
        macos-non-native-fullscreen = "visible-menu";
    };
  };
}