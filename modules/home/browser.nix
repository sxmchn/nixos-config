{ inputs, pkgs, ... }:
{
# home.packages = (
#    with pkgs; [ inputs.zen-browser.packages."${system}".default ]
# );
  home.packages = with pkgs; [ microsoft-edge ];


  programs.chromium = {
    enable = true;
    commandLineArgs = ["--enable-features=UseOzonePlatform --ozone-platform=wayland"];
  };
}
