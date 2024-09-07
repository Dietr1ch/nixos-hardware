{
  imports = [ ../. ];

  boot.kernelParams = [
    "i915.enable_guc=2"
  ];

  # https://nixos.wiki/wiki/Intel_Graphics
  hardware.graphics.extraPackages = with pkgs; [
    intel-media-sdk
  ];
}
