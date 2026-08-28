local KEYS = require("hyprland.keybindings.keys")
local M = {}

function M.register(...)
  return table.concat({ ... }, "+")
end

function M.focus_ws(workspace_id)
  hl.bind(
    M.register(
      KEYS.MODIFIER.SUPER,
      tostring(workspace_id)
    ),
    hl.dsp.focus({
      workspace = tostring(workspace_id)
    }),
    {
      description = "Switch To Workspace # " .. tostring(workspace_id)
    }
  )
end

function M.move_window_to_and_focus_ws(workspace_id)
  hl.bind(
    M.register(
      KEYS.MODIFIER.SUPER,
      KEYS.MODIFIER.SHIFT,
      tostring(workspace_id)
    ),
    hl.dsp.window.move({
      workspace = tostring(workspace_id)
    }),
    {
      description = "Move Window To Workspace # " .. tostring(workspace_id)
    }
  )
end

function M.move_window_to_ws(workspace_id)
  hl.bind(
    M.register(
      KEYS.MODIFIER.SUPER,
      KEYS.MODIFIER.ALT,
      tostring(workspace_id)
    ),
    hl.dsp.window.move({
      workspace = tostring(workspace_id),
      follow = false,
    }),
    {
      description = "Move Window (Silent) To Workspace # " .. tostring(workspace_id)
    }
  )
end

function M.launch_url_as_webapp(url)
  return "google-chrome --app=" .. url
end

function M.register_submap(submap_name, submap_bindings)
  hl.define_submap(submap_name, submap_bindings)
end

return M
