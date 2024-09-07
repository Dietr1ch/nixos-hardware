{
  imports = [ ../. ];

  boot.kernelParams = [
    "i915.enable_fbc=1"
    "i915.enable_psr=2"
  ];

  hardware.graphics.extraPackages = with pkgs; [
    intel-media-sdk
  ];
}
