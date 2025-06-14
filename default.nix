{ pkgs ? import <nixpkgs> {} }:
pkgs.stdenv.mkDerivation (finalAttrs: {
  pname = "extract";
  version = "1.0.0";
  src = ./src;
  buildInputs = [ ];
  installPhase = ''
    mkdir -p $out/bin
    cp extract $out/bin/extract
    chmod +x $out/bin/extract
  '';

  #meta = {
  #  description = "";
  #  homepage = "";
  #  license = lib.licenses.;
  #  maintainers = with lib.maintainers; [  ];
  #};
})
