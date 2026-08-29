local KEYS = require("hyprland.keybindings.keys")
local helpers = require("hyprland.keybindings.helpers")

hl.define_submap("ai_mode", function()
  local clankers = {
    [KEYS.ALPHABET.O] = "https://chatgpt.com",
    [KEYS.ALPHABET.C] = "https://claude.ai",
    [KEYS.ALPHABET.G] = "https://gemini.google.com"
  }
  for bind, clanker_site in pairs(clankers) do
    hl.bind(
      bind,
      function()
        hl.dispatch(hl.dsp.exec_cmd(helpers.url_as_webapp(clanker_site)))
        hl.dispatch(hl.dsp.submap("reset"))
      end
    )
  end
end)
