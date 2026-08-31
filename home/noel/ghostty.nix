{ ... }:

{
  programs.ghostty = {
    enable = true;
    # Ghostty is already installed through nix-darwin
    # Homebrew cask configuration.
    package = null;
    settings = {
        command = "bash -l -c nu";
        background-opacity = 0.95;
        background-blur-radius = 20;
        macos-non-native-fullscreen = "visible-menu";
    };
  };
}