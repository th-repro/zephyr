let
  pkgs = import (builtins.fetchTarball {
    name = "nixos-19.09";
    url = "https://github.com/nixos/nixpkgs-channels/archive/dae3575cee5b88de966d06b11861c602975cb23a.tar.gz";
    sha256 = "0zv948jsw313fmwz3rbwna92hijq8ji3dqlzhliwkvxl1adh8pbg";
  }) {};

  easy-purescript = import (pkgs.fetchFromGitHub {
    owner = "justinwoo";
    repo = "easy-purescript-nix";
    rev = "6cb5825430ab44719139f28b93d50c5810891366";
    sha256 = "1awsywpw92xr4jmkwfj2s89wih74iw4ppaifc97n9li4pyds56h4";
  }) { inherit pkgs; };

  # The resulting packages from running `spago2nix generate`
  spagoPackages = import ./project/spago-packages.nix {};

in

pkgs.stdenv.mkDerivation rec {
  name = "zephyr-test";
  src = ./project;

  purs = easy-purescript.purs;
  zephyr = easy-purescript.zephyr;

  compilePaths =
    let
      getStorePath = pkg: ''"${pkg.outPath}/src/**/*.purs"'';
      dependencies = builtins.attrValues spagoPackages.inputs;
    in
      builtins.toString (builtins.map getStorePath dependencies);

  buildPhase = ''
    ${purs}/bin/purs compile -g corefn "src/**/*.purs" ${compilePaths}
    ${zephyr}/bin/zephyr -f Main.main
  '';

  installPhase = ''
    mkdir -p $out
    mv dce* $out
  '';
}
