## DEPENDENCIES
- [eww](https://github.com/elkowar/eww)
- [playerctl](https://github.com/altdesktop/playerctl)
- [brightnessctl](https://github.com/Hummer12007/brightnessctl) 
- [jq](https://github.com/jqlang/jq)
- [grim-hyprland](https://github.com/eriedaberrie/grim-hyprland)
- [curl](https://github.com/curl/curl)
---
## INSTALLATION
1. Clone the repository:
```bash
git clone https://github.com/Asep5K/eww-bar.git
cd eww-bar
```
2. Copy configuration:
```bash
mkdir -p ~/.config
cp -r eww ~/.config
```
---
## SETUP
> ⚠️ **Note:** Requires Hyprland v0.55.0 or newer for native Lua configuration support.

To sync your workspace with the bar, add this to your `~/.config/hypr/hyprland.lua`
```lua
hl.on("workspace.active", function(w)
	hl.exec_cmd("eww -c ~/.config/eww/bottom-bar update active_workspace=" .. w.id)
end)
```
---
## RUN
### [bottom-bar](./eww/bottom-bar)
```bash
eww -c ~/.config/eww/bottom-bar open-many bar workspace_hover
```
### [left-bar](./eww/left-bar)
```sh
eww -c ~/.config/eww/left-bar open bar
```
---
## KISS (Keep It Simple, Stupid)
### [bottom-bar](./eww/bottom-bar)
*Looking for my full system configuration? Check out my main dotfiles on [Github](https://github.com/Asep5K/asepdots).*

![Preview](./preview.png)

---
### [left-bar](./eww/left-bar)
*Looking for my full system configuration? Check out my main dotfiles on [Codeberg](https://codeberg.org/Asep5K/dotfs).*

<table align="left" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="top">
      <img src="https://codeberg.org/Asep5K/dotfs/raw/branch/main/assets/bar.webp" alt="Niri Bar" style="width: 50px; height: 350px; object-fit: cover; display: block;">
    </td>
    <td valign="top" style="padding-left: 10px;">
      <img src="https://codeberg.org/Asep5K/dotfs/raw/branch/main/assets/a.png" alt="aji pisang" style="height: 350px; width: auto; display: block;">
    </td>
  </tr>
</table>