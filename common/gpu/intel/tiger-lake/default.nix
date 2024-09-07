{ config, lib, ... }:
{
  imports = [ ../. ];
  config = lib.mkMerge [
    (lib.mkIf (lib.versionAtLeast config.boot.kernelPackages.kernel.version "6.8") {
      hardware.intelgpu.driver = "xe";
    })
    (lib.mkIf (config.hardware.intelgpu.driver == "i915") {
      boot.kernelParams = [ "i915.enable_guc=3" ];
    })
  ];

  # https://nixos.wiki/wiki/Intel_Graphics
  hardware.graphics.extraPackages = with pkgs; [
    intel-media-sdk
  ];
}
