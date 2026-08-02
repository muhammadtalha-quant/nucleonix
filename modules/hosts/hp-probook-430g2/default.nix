{ pkgs, ... }: {
    imports = [
        ./hardware-configuration.nix
    ];

    environment.sessionVariables = {
        LIBVA_DRIVER_NAME = "iHD";
    };

    hardware.graphics = {
        enable = true;
        extraPackages = with pkgs; [
            intel-media-driver
            intel-compute-runtime
            vpl-gpu-rt
        ];
    };

    boot.kernelParams = [
        "i915.enable_guc=3"
    ];
}
