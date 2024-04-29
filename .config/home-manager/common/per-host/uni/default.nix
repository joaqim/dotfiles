# Options common to all users but specific to this particular host machine.

{ lib, ... }:

let
  inherit (lib) mkDefault;
in

{
  programs.firefox.profiles.default.settings = {
    # Needed with Firefox 103+ for the font sizes to look right with the 110 DPI
    # of my Philips 346B monitor.  (Note that this replaces
    # `layout.css.devPixelsPerPx = 1.4` since that now would screw-up the UI
    # element sizes with Firefox 103+.)
    "ui.textScaleFactor" = 140;
  };
}
