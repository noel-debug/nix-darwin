{ ... }:

{
  imports = [
    ./nushell.nix
    ./ghostty.nix
  ];

  # Set this once when adopting Home Manager. Do not bump it routinely.
  home.stateVersion = "26.05";
  home.file.".hushlogin".text = "";
}