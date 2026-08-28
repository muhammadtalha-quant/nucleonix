local KEYS = require("hyprland.keybindings.keys")
local helpers = require("hyprland.keybindings.helpers")

local apps = {
  [helpers.register(KEYS.MODIFIER.SUPER, KEYS.SPECIAL.ENTER)]         =
  {
    cmd = "kitty",
    desc = "Open Kitty Terminal"
  },
  [helpers.register(KEYS.MODIFIER.SUPER, KEYS.ALPHABET.B)]            =
  {
    cmd = "google-chrome",
    desc = "Open Google Chrome Browser"
  },
  [helpers.register(KEYS.MODIFIER.SUPER, KEYS.ALPHABET.E)]            =
  {
    cmd = "nautilus",
    desc = "Open File Manager"
  },
  [helpers.register(KEYS.MODIFIER.SUPER, KEYS.PUNCTUATION.SEMICOLON)] =
  {
    cmd = "localsend_app",
    desc = "Open Localsend"
  }
}




local webapps = {
  [helpers.register(KEYS.MODIFIER.ALT, KEYS.ALPHABET.Y)] = {
    cmd = helpers.launch_url_as_webapp("https://youtube.com"),
    desc = "Open Youtube"
  },
  [helpers.register(KEYS.MODIFIER.ALT, KEYS.ALPHABET.W)] = {
    cmd = helpers.launch_url_as_webapp("https://web.whatsapp.com"),
    desc = "Open Whatsapp"
  },
  [helpers.register(KEYS.MODIFIER.ALT, KEYS.ALPHABET.O)] = {
    cmd = helpers.launch_url_as_webapp("https://docs.google.com/document/u/0/"),
    desc = "Open Google Office Suite"
  },
  [helpers.register(KEYS.MODIFIER.ALT, KEYS.ALPHABET.D)] = {
    cmd = helpers.launch_url_as_webapp("https://discord.com"),
    desc = "Open Discord"
  },
  [helpers.register(KEYS.MODIFIER.ALT, KEYS.ALPHABET.G)] = {
    cmd = helpers.launch_url_as_webapp("https://github.com/muhammadtalha-quant"),
    desc = "Open GitHub (My Account)"
  },
  [helpers.register(KEYS.MODIFIER.ALT, KEYS.ALPHABET.M)] = {
    cmd = helpers.launch_url_as_webapp("https://mail.google.com/mail/u/0/#inbox"),
    desc = "Open GitHub (My Account)"
  },
  [helpers.register(KEYS.MODIFIER.ALT, KEYS.ALPHABET.A)] = {
    cmd = hl.dsp.submap("ai_mode"),
    desc = "Launch AI ([o]penai, [c]laude and [g]emini)",
  },
}


for keybind, app in pairs(apps) do
  hl.bind(
    keybind,
    hl.dsp.exec_cmd(app.cmd),
    {
      description = app.desc,
    }
  )
end


for keybind, webapp in pairs(webapps) do
  hl.bind(
    keybind,
    hl.dsp.exec_cmd(webapp.cmd),
    {
      description = webapp.desc,
    }
  )
end
