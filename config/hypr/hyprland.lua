hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = "auto",
})

-- XDG Desktop Portal
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("XDG_BACKEND", "wayland")
hl.env("WAYLAND_DISPLAY", "wayland-1")
hl.env("MOZ_ENABLE_WAYLAND", "1")
-- QT
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
-- GDK
hl.env("GDK_SCALE", "1")
-- Toolkit Backend
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")
-- Disable appimage launcher by default
hl.env("APPIMAGELAUNCHER_DISABLE", "1")

hl.env("XCURSOR_SIZE", "32")
hl.env("HYPRCURSOR_SIZE", "32")

hl.on("hyprland.start", function()
	hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
	hl.exec_cmd("~/.config/ashell/launch.sh")
	hl.exec_cmd("dunst")
	hl.exec_cmd("walker --gapplication-service")
	hl.exec_cmd("systemctl --user start elephant.service")
	hl.exec_cmd("~/.config/hypr/scripts/gtk.sh")
	hl.exec_cmd("wl-paste --watch cliphist store")
	hl.exec_cmd("~/.config/hypr/scripts/eww.sh")
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("hyprpm reload -n")
	hl.exec_cmd("hyprctl setcursor Bibata-Modern-Ice 24")
	hl.exec_cmd("kitty && firefox")
end)

hl.config({
	general = {
		layout = "hy3",
		gaps_in = 4,
		gaps_out = { top = 4, right = 12, bottom = 12, left = 12 },

		border_size = 1,
		--
		-- 		col = {
		-- 			active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
		-- 			inactive_border = "rgba(595959aa)",
		-- 		},
		--
		resize_on_border = true,
	},

	decoration = {
		rounding = 4,
		rounding_power = 2,
		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = 0xee1a1a1a,
		},
		active_opacity = 1.0,
		inactive_opacity = 0.9,
		fullscreen_opacity = 1.0,

		blur = {
			enabled = true,
			size = 3,
			passes = 1,
			ignore_opacity = true,
			xray = true,
			vibrancy = 0.1696,
		},
	},
	--
	animations = {
		enabled = false,
	},
})

hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })
hl.curve("easy", { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global", enabled = true, speed = 5, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, spring = "easy", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })

hl.config({
	dwindle = {
		preserve_split = true, -- You probably want this
	},
})

hl.config({
	misc = {
		force_default_wallpaper = -1, -- Set to 0 or 1 to disable the anime mascot wallpapers
		disable_hyprland_logo = false, -- If true disables the random hyprland logo / anime girl background. :(
	},
})

hl.config({
	input = {
		kb_layout = "us, us",
		kb_variant = "mac, intl",
		kb_model = "",
		kb_options = "ctrl:nocaps,lv3:alt_switch",
		kb_rules = "",

		numlock_by_default = true,
		mouse_refocus = false,
		follow_mouse = 1,

		sensitivity = 0.05, -- -1.0 - 1.0, 0 means no modification.

		touchpad = {
			natural_scroll = false,
			clickfinger_behavior = true,
		},
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

---------------------
---- KEYBINDINGS ----
---------------------

local bind = function(keys, func, opts)
	opts = opts or {}
	return hl.bind("SUPER + " .. keys, func, opts)
end

local bindCommand = function(keys, command, opts)
	opts = opts or {}
	return bind(keys, hl.dsp.exec_cmd(command), opts)
end

local hy3 = hl.plugin.hy3
local HYPRSCRIPTS = "~/.config/hypr/scripts/"

-- Applications
bindCommand("Return", "~/.config/.settings/terminal.sh")
bindCommand("Space", "walker")
bindCommand("R", "hyprlauncher") -- backup for walker
bindCommand("A", "~/.config/.settings/ai.sh")
bindCommand("B", "~/.config/.settings/browser.sh")
bindCommand("E", "~/.config/.settings/filemanager.sh")
bindCommand(
	"SHIFT + E",
	"rofi -show emoji -no-show-match -no-sort -config ~/.config/rofi/config-emoji.rasi -replace -i"
)
bindCommand("SHIFT + B", "~/.config/ashell/launch.sh")
bindCommand("F8", HYPRSCRIPTS .. "screenshot.sh")

-- Session
bindCommand("Delete", "hyprshutdown")

-- Layout management
bind("S", hy3.change_group("opposite"))
bind("G", hy3.make_group("h"))
bind("V", hy3.make_group("v"))

-- Window management
bind("SHIFT + Q", hy3.kill_active())
bind("F", hl.dsp.window.fullscreen())
bind("T", hl.dsp.window.float())
bind("C", hl.dsp.window.center())

-- Window navigation
bind("Tab", hl.dsp.window.cycle_next())
bind("H", hy3.move_focus("l"))
bind("J", hy3.move_focus("u"))
bind("K", hy3.move_focus("d"))
bind("L", hy3.move_focus("r"))

bind("SHIFT + H", hy3.move_window("l"))
bind("SHIFT + J", hy3.move_window("u"))
bind("SHIFT + K", hy3.move_window("d"))
bind("SHIFT + L", hy3.move_window("r"))

-- bind = $mainMod, P, submap, passthru # Passthrough SUPER key to virtual machine
-- submap = passthru
-- bind = SUPER, Escape, submap, reset # Get SUPER key back from virtual machine
-- submap = reset

-- Workspace management
bind("M", hl.dsp.workspace.toggle_special("magic"))
bind("SHIFT + M", hl.dsp.window.move({ workspace = "special:magic" }))

for i = 1, 10 do
	local key = i % 10
	bind(key, hl.dsp.focus({ workspace = i }))
	bind("SHIFT + " .. key, hy3.move_to_workspace(i, { follow = true }))
end

-- Move/resize windows with mainMod + LMB/RMB and dragging
bind("mouse:272", hl.dsp.window.drag(), { mouse = true })
bind("mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Special keys
local bindKey = function(key, command, opts)
	opts = opts or {}
	return hl.bind(key, hl.dsp.exec_cmd(command), opts)
end

-- bind = $mainMod SHIFT, P, exec, hyprctl switchxkblayout asustek-rog-omni-receiver-keyboard next
-- bind = $mainMod SHIFT, O, exec, hyprctl switchxkblayout zsa-technology-labs-moonlander-mark-i-keyboard next
bindKey("XF86AudioRaiseVolume", "ashell msg volume-up", { locked = true, repeating = true })
bindKey("XF86AudioLowerVolume", "ashell msg volume-down", { locked = true, repeating = true })
bindKey("XF86AudioMute", "ashell msg volume-toggle-mute", { locked = true })
bindKey("XF86AudioMicMute", "ashell msg microphone-toggle-mute", { locked = true })

bindKey("XF86MonBrightnessUp", "brightnessctl -e4 -n2 set 5%+", { locked = true, repeating = true })
bindKey("XF86MonBrightnessDown", "brightnessctl -e4 -n2 set 5%-", { locked = true, repeating = true })

bindKey("XF86AudioNext", "playerctl next", { locked = true })
bindKey("XF86AudioPause", "playerctl pause", { locked = true })
bindKey("XF86AudioPlay", "playerctl play-pause", { locked = true })
bindKey("XF86AudioPrev", "playerctl previous", { locked = true })

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------
local function merge(...)
	local result = {}

	for _, t in ipairs({ ... }) do
		for k, v in pairs(t) do
			result[k] = v
		end
	end

	return result
end

local window_rule = function(match, opts)
	opts = merge({
		match = match,
	}, opts or {})

	return hl.window_rule(opts)
end

local set_workspace = function(match, workspace)
	return window_rule(match, { workspace = workspace })
end

local force_float = function(matchingClass, opts)
	opts = merge({
		name = "force-float-" .. matchingClass,
		pin = false,
		float = true,
	}, opts or {})

	return window_rule({ class = matchingClass }, opts)
end

set_workspace({ initial_class = "firefox" }, 2)
set_workspace({ class = "chrome-oiocllghmdadfpahmllbbhkgjfmaidmm-Default" }, 3)
set_workspace({ class = "Postman" }, 3)
set_workspace({ class = "steam" }, 5)
set_workspace({ class = "Spotify" }, 10)

force_float("org.pulseaudio.pavucontrol", { size = "1000 600", pin = true })
force_float("blueman-manager", { size = "800 500", pin = true })
force_float("nm-connection-editor", { size = "900 600", pin = true })
force_float("io.missioncenter.MissionCenter", { size = "1200 800", pin = true })

force_float("qalculate-gtk", { size = "1000 600" })
force_float("org.gnome.DiskUtility", { size = "700 600" })
force_float("thunar", { size = "1200 800" })

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

-- Hyprland-run windowrule
hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move = "20 monitor_h-120",
	float = true,
})
