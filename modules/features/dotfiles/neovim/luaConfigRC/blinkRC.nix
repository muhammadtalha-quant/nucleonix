''
    local blink_cfg = require("blink.cmp.config")

    blink_cfg.completion.menu.draw.components = blink_cfg.completion.menu.draw.components or {}
    blink_cfg.completion.menu.draw.columns = {
      { "label" },
      { "source" }
    }
    blink_cfg.completion.menu.draw.components.source = {
      text = function(ctx)
        if ctx.source_name == "LSP" then
          return "[LSP]"
        elseif ctx.source_name == "Snippets" then
          return "[Snippet]"
        elseif ctx.source_name == "Path" then
          return "[Path]"
        elseif ctx.source_name == "Buffer" then
          return "[Buffer]"
        else
          return "[" .. ctx.source_name .. "]"
        end
      end
    }
''
