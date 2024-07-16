{
  stdenvNoCC,
  lib,
  fetchFromGitHub,
  ...
}:
stdenvNoCC.mkDerivation {
  pname = "rime-ice";
  version = "37ca416a9c755716d049c549b131276ddc440688";
  src = fetchFromGitHub {
    owner = "iDvel";
    repo = "rime-ice";
    rev = "37ca416a9c755716d049c549b131276ddc440688";
    fetchSubmodules = false;
    sha256 = "sha256-uEE+KWkIjCvB/cuLNm94lFm7HLb9cCgFE7t6NCTVEoo=";
  };
  date = "2024-07-03";

  buildPhase = ''
    mv default.yaml rime_ice_suggestion.yaml
  '';

  installPhase = ''
    mkdir -p $out/share/rime-data
    cp -r * $out/share/rime-data/
  '';

  meta = with lib; {
    maintainers = with lib.maintainers; [ xddxdd ];
    description = "Rime 配置：雾凇拼音 | 长期维护的简体词库 ";
    homepage = "https://dvel.me/posts/rime-ice/";
    license = licenses.gpl3Only;
  };
}
