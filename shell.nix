{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  packages = [
    (pkgs.octave.withPackages (octavePackages: [ octavePackages.image ]))
  ];
}
