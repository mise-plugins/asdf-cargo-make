{
  inputs = {
    # Candidate channels
    #   - https://github.com/kachick/anylang-template/issues/17
    #   - https://discourse.nixos.org/t/differences-between-nix-channels/13998
    # How to update the revision
    #   - `nix flake update --commit-lock-file` # https://nixos.org/manual/nix/stable/command-ref/new-cli/nix3-flake-update.html
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        formatter = pkgs.nixpkgs-fmt;
        devShells.default = with pkgs;
          mkShell {
            buildInputs = [
              # - Use newest bash to avoid darwin old bash problems. For example #139
              # - Avoid https://github.com/NixOS/nix/issues/730#issuecomment-162323824
              bashInteractive

              # Keep minimum tools in nix layer, this repository should depend them with the asdf or mise itself(.tool-versions)
              # So written here should be also clarified in [depedndencies](README.md#Dependencies)
              curl
              unzip
              asdf-vm
              # Also do not specify mise to avoid conflict with asdf
              # mise
            ];

            shellHook = ''
              . "${pkgs.asdf-vm}/share/asdf-vm/asdf.sh"
            '';
          };
      }
    );
}
