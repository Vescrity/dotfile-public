dotfiles managed by stow.  
Not actively maintained.

## Usage

For example, install the config of niri,
1. make this repo as a folder in `$HOME`,
2. then run the follwing command in this repo:

```bash
stow niri
```

it will create **symbolic link** to the target place.

## Dependency (niri session)

maybe not the full list.
- alacritty
- niri
- waybar
- nwg-panel
- wf-recorder (screen-recorder, dependency of wfrc)
- slurp (wfrc)
- wmenu (launcher)
- xdg-desktop-portal-gnome
- xdg-desktop-portal-gtk
- fuzzel (optional)
- nwg-drawer (optional)
- nwg-bar (for exit)
- nwg-clipman (for clipboard)
- swaync (notification)
- lxqt-policykit

## keybindings (niri session)

- Mod + Enter : terminal
- Mod + HJKL : move focus
- Mod + Number : Change workspace
- Mod + Shift + ... : move window to ...
- Mod + S : record screen (wfrc)
- Mod + D : launcher
- ....

## About wfrc

see https://github.com/Vescrity/wfrc
