{config, pkgs, ...}:
with pkgs; let
  patchDesktop = pkg: appName: from: to: (lib.hiPrio (runCommand "$patched-desktop-entry-for-${appName}" {} ''
  ${coreutils}/bin/mkdir -p $out/share/applications
  ${gnused}/bin/sed 's#${from}#${to}#g' < ${pkg}/share/applications/${appName}.desktop > $out/share/applications/${appName}.desktop ''));
in {
  home.packages = with pkgs; [
    obsidian 
    (patchDesktop obsidian "obsidian" "^Exec=obsidian" "Exec=env OBSIDIAN_USE_WAYLAND=1 obsidian -enable-features=UseOzonePlatform -ozone-platform=wayland")
  ];
}
