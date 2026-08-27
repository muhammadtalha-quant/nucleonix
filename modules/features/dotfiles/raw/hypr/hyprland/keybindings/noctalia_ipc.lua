local KEYS = require("hyprland.keybindings.keys")
local helpers = require("hyprland.keybindings.helpers")

local noctalia_ipc = {
  [helpers.register(KEYS.MODIFIER.SUPER, KEYS.SPECIAL.SPACE)] = { cmd = "noctalia msg panel-toggle launcher", rep = false, desc = "Toggle Launcher" },
  [helpers.register(KEYS.MODIFIER.SUPER, KEYS.PUNCTUATION.PERIOD)] = { cmd = "noctalia msg settings-toggle", rep = false, desc = "Toggle Settings" },
  [helpers.register(KEYS.MODIFIER.SUPER, KEYS.ALPHABET.V)] = { cmd = "noctalia msg panel-toggle clipboard", rep = false, desc = "Toggle Clipboard History" },
  [helpers.register(KEYS.MODIFIER.SUPER, KEYS.PUNCTUATION.COMMA)] = { cmd = "noctalia msg panel-toggle launcher /e", rep = false, desc = "Toggle Emoji Selector" },
  [KEYS.XF86.AUDIORAISEVOLUME] = { cmd = "noctalia msg volume-up", rep = true, desc = "Increase Volume" },
  [KEYS.XF86.AUDIOLOWERVOLUME] = { cmd = "noctalia msg volume-down", rep = true, desc = "Decrease Volume" },
  [KEYS.XF86.BRIGHTNESSUP] = { cmd = "noctalia msg brightness-up", rep = true, desc = "Increase Brightness" },
  [KEYS.XF86.BRIGHTNESSDOWN] = { cmd = "noctalia msg brightness-down", rep = true, desc = "Decrease Brightness" },
  [KEYS.XF86.AUDIOMUTE] = { cmd = "noctalia msg volume-mute", rep = false, desc = "Toggle Mute" },
  [KEYS.XF86.AUDIOPLAY] = { cmd = "noctalia msg media toggle", rep = false, desc = "Toggle Audio Play/Pause" },
  [KEYS.SPECIAL.PRINT] = { cmd = "noctalia msg screenshot-region", rep = false, desc = "Capture Region" },
  [helpers.register(KEYS.MODIFIER.CTRL, KEYS.MODIFIER.ALT, KEYS.NAVIGATION.DELETE)] = { cmd = "noctalia msg panel-toggle session", rep = false, desc = "Toggle Session Menu" },
  [helpers.register(KEYS.MODIFIER.SUPER, KEYS.ALPHABET.L)] = { cmd = "noctalia msg session lock", rep = false, desc = "Lock Session" },
  [helpers.register(KEYS.MODIFIER.SUPER, KEYS.ALPHABET.W)] = { cmd = "noctalia msg wallpaper-random", rep = false, desc = "Random Wallpaper" },
}


for keybind, ipc in pairs(noctalia_ipc) do
  hl.bind(
    keybind,
    hl.dsp.exec_cmd(ipc.cmd),
    {
      description = ipc.desc,
      repeating = ipc.rep
    }
  )
end
