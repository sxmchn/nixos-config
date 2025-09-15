{ username, ... }:
{
  services = {
    xserver = {
      enable = true;
      xkb.layout = "us,ru";
      windowManager.fvwm2.gestures = true;
    };

    displayManager.autoLogin = {
      enable = true;
      user = "${username}";
    };
    libinput = {
      enable = true;
    };
  };
  # To prevent getting stuck at shutdown
  systemd.settings.Manager.DefaultTimeoutStopSec = "10s";
}
