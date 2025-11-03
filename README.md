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
<img width="1920" height="1080" alt="图片" src="https://github.com/user-attachments/assets/ae0ba22c-e2b1-4593-83e0-485a1f2fa610" />
<img width="1920" height="1080" alt="图片" src="https://github.com/user-attachments/assets/83e53455-61f4-4cee-93e9-3b34e692302e" />
<img width="1920" height="1080" alt="图片" src="https://github.com/user-attachments/assets/770aa8fb-0bbe-4eb4-81d5-8d9f7f827853" />


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
| xfce      | (The bottom panel, Not shown in this repo) |
| matugen   | Color scheme generator |
| mpv       | |
| niri      | |
| nvim      | |
| nwg       | nwg-{dock,bar,panel,drawer}|
| swaync    | Notification Center |
| systemd   | systemd config |
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

## zsh config

some config for system-wide are placed [here](https://github.com/Vescrity/my-zsh-system-config)

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
