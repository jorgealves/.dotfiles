{ config, pkgs, ...};

{
  home.username = "jalves";
  home.homeDirectory = "/home/jalves";
  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  home.packages = with pkgs; [
    
    neofetch,
    nnn, # terminal file manager

    # archives
    zip,
    xz,
    unzip,
    p7zip,

    #utils
    ripgrep,
    jq,
    yq-go,
    eza,
    fzf,

    #networking tools
    mtr,
    iperf3,
    dnsutils,
    nmap,
    ipcalc,
    socat,
    aria2,
    ldns

    #misc
    file,
    which,
    tree,
    gnused,
    gnutar,
    gawk,
    gnupg,
    zstd,

    #nix related
    nix-output-monitor,
    
    #productivity
    glow,
    btop,
    iotop,
    iftop,

    # system monitoring
    strace,
    ltrace,
    lsof,

    # system tools
    sysstat,
    lm_sensors,
    ethtool,
    pciutils,
    usbutils


  ]
}
