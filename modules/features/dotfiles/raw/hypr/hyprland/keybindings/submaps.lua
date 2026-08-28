local KEYS = require("hyprland.keybindings.keys")
local helpers = require("hyprland.keybindings.helpers")

helpers.register_submap("ai_mode", function()
  local clankers = {
    [KEYS.ALPHABET.O] = "https://chatgpt.com",
    [KEYS.ALPHABET.C] = "https://claude.ai",
    [KEYS.ALPHABET.G] = "https://gemini.google.com"
  }
  for bind, clanker_site in pairs(clankers) do
    hl.bind(
      bind,
      function()
        helpers.launch_url_as_webapp(clanker_site)
        hl.dsp.submap("reset")
      end
    )
  end
end)
