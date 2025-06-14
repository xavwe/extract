{
  pkgs ? import <nixpkgs> {},
}:
pkgs.stdenv.mkDerivation (finalAttrs: {
  pname = "extract";
  version = "1.0.0";
  src = ./src;
  buildInputs = [ pkgs.makeWrapper ];
  installPhase = ''
    mkdir -p $out/bin
    cp extract $out/bin/extract
    chmod +x $out/bin/extract
    wrapProgram $out/bin/extract \
      --prefix PATH : ${pkgs.gnutar}/bin \
      --prefix PATH : ${pkgs.xz}/bin \
      --prefix PATH : ${pkgs.bzip2}/bin \
      --prefix PATH : ${pkgs.gzip}/bin \
      --prefix PATH : ${pkgs.unzip}/bin \
      --prefix PATH : ${pkgs.ncompress}/bin \
      --prefix PATH : ${pkgs.p7zip}/bin \
      --prefix PATH : ${pkgs.cabextract}/bin \
      --prefix PATH : ${pkgs.cpio}/bin \
  '';

  #meta = {
  #  description = "";
  #  homepage = "";
  #  license = lib.licenses.;
  #  maintainers = with lib.maintainers; [  ];
  #};
})
