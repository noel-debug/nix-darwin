{ pkgs, ... }: {
  # CLI packages to install on both macOS and Linux
  environment.systemPackages = [
    pkgs.git
    pkgs.ripgrep
    pkgs.jq
    pkgs.github-cli
    pkgs.nushell
    pkgs.fastfetch
    pkgs.fd
    pkgs.neovim
    pkgs.tree-sitter
  ];
}
