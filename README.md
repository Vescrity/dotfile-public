My dotfiles managed by stow.  

*Function over form.*

## Usage

For example, install the config of niri,
1. make this repo as a folder in `$HOME`,
2. then run the follwing command in this repo:

```bash
stow niri
```

it will create **symbolic link** to the target place.

## IMG
<img width="1920" height="1080" alt="图片" src="https://github.com/user-attachments/assets/fd16a51d-135c-45fd-86b1-42459ce9fdfa" />
<img width="1920" height="1079" alt="图片" src="https://github.com/user-attachments/assets/f6bbd392-7f7b-4821-a590-4562b1a43742" />
<img width="1920" height="1080" alt="图片" src="https://github.com/user-attachments/assets/1bba5a99-896a-46dd-955f-eeacaa0644df" />


## CURRENTLY-USING

The list of the folders I'm currently using.

| DIR | USE For |
|-|-|
| bin       | Scripts                          |
| env       | Environments for desktop session |
| fcitx5    | Fcitx |
| foot      | Terminal |
| fontconfig| Fonts |
| gtklock   | Screen Lock |
| htop      | |
| lxqt      | |
| matugen   | Color scheme generator |
| mpv       | |
| niri      | |
| nvim      | |
| nwg       | nwg-{dock,bar,panel,drawer}|
| swaync    | Notification Center |
| themes    | GTK THEME |
| waybar    | Bar |
| xdg-desktop-portal | Portals |
| zsh       | shell config |


## Dependency (niri session)

maybe not the full list.
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
