---@module 'hl'
-- Refer to the wiki for more information.
-- https://wiki.hyprland.org/Configuring/

-- Setup require paths
local user_home = os.getenv("XDG_CACHE_HOME") or os.getenv("HOME")
package.path = user_home .. "/wallust/?.lua" .. ";" .. package.path

--###############
--## MONITORS ###
--###############
-- See https://wiki.hyprland.org/Configuring/Monitors/

-- Integrated
hl.monitor({
    output   = "eDP-1",
    mode     = "preferred",
    position = "auto",
    scale    = 1
})

-- BenQ Curved monitor
hl.monitor({
    output = "desc:BNQ BenQ",
    mode   = "preferred",
    position = "auto-up",
    scale = 1.07
})

-- TV
hl.monitor({
    output = "descLG",
    scale  = 1.5,
    mode   = "preferred",
    position = "auto-up"
})

-- Other HDMI
hl.monitor({
    output   = "HDMI-A-1",
    mode     = "preferred",
    position = "auto-up",
    scale    = 1,
})

-- Fallback
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = 1,
})


--###################
--## COLOR SCHEME ###
--###################

local colors = require("colors")


--##################
--## MY PROGRAMS ###
--##################
-- See https://wiki.hyprland.org/Configuring/Keywords/
-- Set programs that you use

local terminal = "kitty"
local fileManager = "kitty yazi"
local webBrowser = "firefox"
local editor = "zeditor"
local notifications = "mako"
local screenshots = "hyprshot"
local emojiPicker = "wofi-emoji"
local loginManager = "lemurs"


--############################
--## ENVIRONMENT VARIABLES ###
--############################
-- See https://wiki.hypr.land/Configuring/Environment-variables/

hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Ice")
hl.env("XCURSOR_SIZE", 24)
hl.env("HYPRCURSOR_SIZE", 24)


--##################
--## PERMISSIONS ###
--##################
-- See https://wiki.hyprland.org/Configuring/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons
-- ecosystem {
--   enforce_permissions = 1
-- }
-- permission = /usr/(bin|local/bin)/grim, screencopy, allow
-- permission = /usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland, screencopy, allow
-- permission = /usr/(bin|local/bin)/hyprpm, plugin, allow


--####################
--## LOOK AND FEEL ###
--####################
-- Refer to https://wiki.hyprland.org/Configuring/Variables/
-- https://wiki.hyprland.org/Configuring/Variables/#general

hl.config({
    general = {
        gaps_in = 0,
        gaps_out = 0,
        border_size = 1,
        resize_on_border = true,
        allow_tearing = false,
        layout = "dwindle",
        col = {
            active_border = { colors = { colors.c5, colors.c10 }, angle = 45 },
            inactive_border = colors.background,
        },
    },
})

-- https://wiki.hyprland.org/Configuring/Variables/#decoration
hl.config({
    decoration = {
        rounding = 3,
        rounding_power = 25,
        -- Change transparency of focused and unfocused windows
        active_opacity = 1.0,
        inactive_opacity = 0.95,
        shadow = {
            enabled = false,
            range = 12,
            render_power = 3,
            color = colors.background,
        },
        -- https://wiki.hyprland.org/Configuring/Variables/#blur
        blur = {
            enabled = true,
            size = 3,
            passes = 2,
            vibrancy = 0.5,
        },
    },
})

-- https://wiki.hyprland.org/Configuring/Variables/#animations
hl.config({
    animations = {
        enabled = true,
    },
})
hl.curve("easeOutQuint", {
    type = "bezier",
    points = { { 0.23, 1 }, { 0.32, 1 } },
})
hl.curve("easeInOutCubic", {
    type = "bezier",
    points = { { 0.65, 0.05 }, { 0.36, 1 } },
})
hl.curve("linear", {
    type = "bezier",
    points = { { 0, 0 }, { 1, 1 } },
})
hl.curve("almostLinear", {
    type = "bezier",
    points = { { 0.5, 0.5 }, { 0.75, 1 } },
})
hl.curve("quick", {
    type = "bezier",
    points = { { 0.15, 0 }, { 0.1, 1 } },
})
hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "quick" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, bezier = "easeOutQuint", style = "slide" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 4.1, bezier = "easeOutQuint", style = "slide" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 5, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 2, bezier = "easeOutQuint", style = "slidevert" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 2, bezier = "easeOutQuint", style = "slidevert" })

-- See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
hl.config({
    dwindle = {
        preserve_split = true,
        -- You probably want this
    },
})

-- See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
hl.config({
    master = {
        new_status = "master",
    },
})

-- https://wiki.hyprland.org/Configuring/Variables/#misc
hl.config({
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
    },
})


--############
--## INPUT ###
--############
-- https://wiki.hyprland.org/Configuring/Variables/#input

hl.config({
    input = {
        kb_layout = "gb",
        repeat_delay = 300,
        natural_scroll = false,
        accel_profile = "adaptive",
        follow_mouse = 1,
        sensitivity = 0.25,
        touchpad = {
            natural_scroll = true,
            scroll_factor = 1,
        },
    },
})

-- See https://wiki.hypr.land/Configuring/Gestures
hl.gesture({
    ["fingers"] = 3,
    ["direction"] = "vertical",
    ["action"] = "workspace",
})

hl.gesture({
    ["fingers"] = 3,
    ["direction"] = "horizontal",
    ["action"] = "resize",
})

-- Example per-device config
-- See https://wiki.hyprland.org/Configuring/Keywords/#per-device-input-configs for more
hl.device({
    name = "epic-mouse-v1",
    sensitivity = -0.5,
})


--##################
--## KEYBINDINGS ###
--##################
-- See https://wiki.hyprland.org/Configuring/Keywords/

-- Sets "Windows" key as main modifier
local mainMod = "SUPER"

-- Window/Layout
hl.bind(mainMod .. " + " .. "W", hl.dsp.window.close())
hl.bind(mainMod .. " + " .. "V", hl.dsp.window.float())
hl.bind(mainMod .. " + " .. "P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + " .. "J", hl.dsp.layout("togglesplit"))

-- Applications
hl.bind(mainMod .. " + " .. "T", hl.dsp.exec_cmd("uwsm-app -- kitty"))
hl.bind(mainMod .. " + " .. "L", hl.dsp.exec_cmd("uwsm-app -- hyprlock"))
hl.bind(mainMod .. " + " .. "F", hl.dsp.exec_cmd("uwsm-app -- kitty yazi"))
-- bind = $mainMod, R, exec, uwsm-app -- hyprlauncher
hl.bind(mainMod .. " + " .. "R", hl.dsp.exec_cmd("uwsm-app -- $(wofi --show drun --define=drun-print_desktop_file=true)"))
hl.bind(mainMod .. " + " .. "B", hl.dsp.exec_cmd("uwsm-app -- firefox"))
hl.bind(mainMod .. " + " .. "E", hl.dsp.exec_cmd("uwsm-app -- zeditor"))
hl.bind(mainMod .. " + " .. "PERIOD", hl.dsp.exec_cmd("uwsm-app -- wofi-emoji"))

-- Logins
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "L", hl.dsp.exec_cmd("hyprshutdown --top-label 'Logging out' --post-cmd 'loginctl terminate-user harry'"))

-- Power management Pay attention to the warnings in Environment variables, Multi-GPU and Dispatchers sections.
hl.bind(mainMod .. " + " .. "U", hl.dsp.exec_cmd("hyprshutdown --top-label 'Shutting down...' --post-cmd 'shutdown -P 0'"))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "U", hl.dsp.exec_cmd("hyprshutdown --top-label 'Rebooting...' --post-cmd 'reboot'"))

-- Screenshots
hl.bind("Print", hl.dsp.exec_cmd("hyprshot -m output --freeze"))
hl.bind("SHIFT" .. " + " .. "Print", hl.dsp.exec_cmd("hyprshot -m window --freeze"))
hl.bind(mainMod .. " + " .. "Print", hl.dsp.exec_cmd("hyprshot -m region --freeze"))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + " .. "left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + " .. "right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + " .. "up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + " .. "down", hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
hl.bind(mainMod .. " + " .. 1, hl.dsp.focus({ workspace = 1 }))
hl.bind(mainMod .. " + " .. 2, hl.dsp.focus({ workspace = 2 }))
hl.bind(mainMod .. " + " .. 3, hl.dsp.focus({ workspace = 3 }))
hl.bind(mainMod .. " + " .. 4, hl.dsp.focus({ workspace = 4 }))
hl.bind(mainMod .. " + " .. 5, hl.dsp.focus({ workspace = 5 }))
hl.bind(mainMod .. " + " .. 6, hl.dsp.focus({ workspace = 6 }))
hl.bind(mainMod .. " + " .. 7, hl.dsp.focus({ workspace = 7 }))
hl.bind(mainMod .. " + " .. 8, hl.dsp.focus({ workspace = 8 }))
hl.bind(mainMod .. " + " .. 9, hl.dsp.focus({ workspace = 9 }))
hl.bind(mainMod .. " + " .. 0, hl.dsp.focus({ workspace = 10 }))

-- Move active window to a workspace with mainMod + SHIFT + [0-9]
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 1, hl.dsp.window.move({ workspace = 1 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 2, hl.dsp.window.move({ workspace = 2 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 3, hl.dsp.window.move({ workspace = 3 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 4, hl.dsp.window.move({ workspace = 4 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 5, hl.dsp.window.move({ workspace = 5 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 6, hl.dsp.window.move({ workspace = 6 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 7, hl.dsp.window.move({ workspace = 7 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 8, hl.dsp.window.move({ workspace = 8 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 9, hl.dsp.window.move({ workspace = 9 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 0, hl.dsp.window.move({ workspace = 10 }))

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + " .. "S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + " .. "mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + " .. "mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "left", hl.dsp.window.resize({ x = -50, y = 0, relative = true }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "right", hl.dsp.window.resize({ x = 50, y = 0, relative = true }))
hl.bind(mainMod .. " + " .. "mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + " .. "mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

--#############################
--## WINDOWS AND WORKSPACES ###
--#############################
-- See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
-- See https://wiki.hyprland.org/Configuring/Workspace-Rules/ for workspace rules

hl.window_rule({
    name  = "suppress-maximize-events",
    match = {
        class = ".*",
    },
    suppress_event = "maximize",
})

hl.window_rule({
    name  = "fix-xwayland-drags",
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

-- Autostart
hl.on("hyprland.start", function()
    hl.exec_cmd("uwsm-app -- waybar")
    hl.exec_cmd("nm-applet --indicator")
    hl.exec_cmd("hyprctl setcursor HYPRCURSOR_THEME HYPRCURSOR_SIZE")
    -- exec-once = uwsm-app -- hyprlauncher -d
end)
