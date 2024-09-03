{
  imports = [ ../. ];

  # https://ark.intel.com/content/www/us/en/ark/products/codename/215599/products-formerly-raptor-lake.html
  #
  # i5-13500H
  # i7-13700H
  # i9-13900HX
  # i7 14700HX
  # i9 14900HX

  hardware.graphics = {
    enable = true;

    # https://nixos.wiki/wiki/Intel_Graphics
    extraPackages = with pkgs; [
      (
        if (lib.versionAtLeast (lib.versions.majorMinor lib.version) "24.05") then
          vpl-gpu-rt # for newer GPUs on NixOS >24.05 or unstable
        else
          onevpl-intel-gpu  # for newer GPUs on NixOS <= 24.05
      )
    ];
  };
}
