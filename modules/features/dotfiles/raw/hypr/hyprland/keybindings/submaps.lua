local KEYS = require("hyprland.keybindings.keys")
local helpers = require("hyprland.keybindings.helpers")

hl.define_submap("ai_mode", function()
  local clankers = {
    [KEYS.ALPHABET.O] = helpers.url_as_webapp("https://chatgpt.com"),
    [KEYS.ALPHABET.C] = helpers.url_as_webapp("https://claude.ai"),
    [KEYS.ALPHABET.G] = helpers.url_as_webapp("https://gemini.google.com")
  }
  for bind, clanker in pairs(clankers) do
    hl.bind(
      bind,
      function()
        hl.dispatch(hl.dsp.exec_cmd(clanker))
        hl.dispatch(hl.dsp.submap("reset"))
      end
    )
  end
end)

hl.define_submap("socialmedia", function()
  local timekillers = {
    [KEYS.ALPHABET.Y] = helpers.url_as_webapp("https://www.youtube.com/"),
    [KEYS.ALPHABET.R] = helpers.url_as_webapp("https://www.reddit.com/"),
    [KEYS.ALPHABET.F] = helpers.url_as_webapp("https://www.facebook.com/"),
    [KEYS.ALPHABET.I] = helpers.url_as_webapp("https://www.instagram.com/"),
    [KEYS.ALPHABET.T] = helpers.url_as_webapp("https://www.tiktok.com/"),
  }
  for bind, timekiller in pairs(timekillers) do
    hl.bind(
      bind,
      function()
        hl.dispatch(hl.dsp.exec_cmd(timekiller))
        hl.dispatch(hl.dsp.submap("reset"))
      end
    )
  end
end)
