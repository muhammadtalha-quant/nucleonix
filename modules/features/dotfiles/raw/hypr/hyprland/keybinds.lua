-- keybinds aggregator 
local function chord(...)
    return table.concat({...}, "+")
end 

local  KEYS = {
    MODIFIER = {
        SUPER = "SUPER",
        CTRL = "CONTROL",
        ALT = "ALT",
        SHIFT = "SHIFT"
    },
    ALPHABET = {
        A = "A",
        B = "B",
        C = "C",
        D = "D",
        E = "E",
        F = "F",
        G = "G",
        H = "H",
        I = "I",
        J = "J",
        K = "K",
        L = "L",
        M = "M",
        N = "N",
        O = "O",
        P = "P",
        Q = "Q",
        R = "R",
        S = "S",
        T = "T",
        U = "U",
        V = "V",
        W = "W",
        X = "X",
        Y = "Y",
        Z = "Z"
    },
    ARROW = {
        LEFT = "LEFT",
        RIGHT = "RIGHT",
        UP = "UP",
        DOWN = "DOWN",
    },
    PUNCTUATION = {
        COMMA = "COMMA",
        PERIOD = "PERIOD",
        SEMICOLON = "SEMICOLON",
        APOSTROPHE = "APOSTROPHE",
    },
    SYMBOL = {
        EQUAL = "EQUAL",
        MINUS = "MINUS",
        BRACKETRIGHT = "BRACKETRIGHT",
        BRACKETLEFT = "BRACKETLEFT",
        SLASH = "SLASH",
        BACKSLASH = "BACKSLASH",
        BACKTICK = "GRAVE"
    },
    SPECIAL = {
        BACKSPACE  = "BACKSPACE",
        ENTER = "RETURN",
        SPACE = "SPACE",
        TAB = "TAB",
        ESCAPE = "ESCAPE",
        PRINT = "PRINT"
    },
    LOCKS = {
        CAPSLOCK = "Caps_Lock",
        NUMLOCK = "Num_Lock",
        SCROLLLOCK = "Scroll_Lock"
    },
    NAVIGATION = {
        INSERT = "INSERT",
        DELETE = "DELETE",
        HOME = "HOME",
        END = "END",
        PGUP = "PRIOR",
        PGDN = "NEXT",
    },
    FUNCTION = {
        F1 = "F1",
        F2 = "F2",
        F3 = "F3",
        F4 = "F4",
        F5 = "F5",
        F6 = "F6",
        F7 = "F7",
        F8 = "F8",
        F9 = "F9",
        F10 = "F10",
        F11 = "F11",
        F12 = "F12",
    },
    XF86 = {
        -- Update according to your keyboard; use wev to find sym
        -- Based on my current keyboard, ZUNTUO wired keyboard, model unknown
        HOMEPAGE = "XF86HomePage",                               -- Fn + F1   
        MAIL = "XF86Mail",                                       -- Fn + F2     
        SEARCH = "XF86Search",                                   -- Fn + F3 
        TOOLS = "XF86Tools",                                     -- Fn + F4   
        AUDIOPLAY = "XF86AudioPlay",                             -- Fn + F5   
        AUDIOPREV = "XF86AudioPrev",                             -- Fn + F6       
        AUDIONEXT = "XF86AudioNext",                             -- Fn + F7       
        AUDIOLOWERVOLUME = "XF86AudioLowerVolume",               -- Fn + F8               
        AUDIORAISEVOLUME = "XF86AudioRaiseVolume",               -- Fn + F9               
        AUDIOMUTE = "XF86AudioMute",                             -- Fn + F10           
        EXPLORER = "XF86Explorer",                               -- Fn + F11           
        CALCULATOR = "XF86Calculator",                           -- Fn + F12         
        
        -- copied from my laptop's faulty keyboard
        BRIGHTNESSDOWN = "XF86MonBrightnessDown",              -- Fn + F9     (ON MY LAPTOP)
        BRIGHTNESSUP = "XF86MonBrightnessUp",                  -- Fn + F10    (ON MY LAPTOP)
        SLEEP = "XF86Sleep",                                   -- Fn + F3     (ON MY LAPTOP)
    },
    MOUSE = {
        LMB = "mouse:272",
        RMB = "mouse:273",
        MMB = "mouse:274"
    }, 
}


-- 1. Apps

local native_apps = {
    [chord(KEYS.MODIFIER.SUPER, KEYS.SPECIAL.ENTER)] = {cmd = "ghostty",                 desc = "Open Ghostty Terminal"},
    [chord(KEYS.MODIFIER.SUPER, KEYS.ALPHABET.B)]    = {cmd = "google-chrome",    desc = "Open Google Chrome Browser"},
    [chord(KEYS.MODIFIER.SUPER, KEYS.ALPHABET.E)]    = {cmd = "nautilus",                desc = "Open File Manager"},
    [chord(KEYS.MODIFIER.SUPER, KEYS.PUNCTUATION.SEMICOLON)]    = {cmd = "localsend_app",           desc = "Open Localsend"}
}

for keybind,app in pairs(native_apps) do 
     hl.bind(
        keybind,
        hl.dsp.exec_cmd(app.cmd),
        {
            description = app.desc,
        }
     )
end


-- 2. Utilities

local ipc = {
    [chord(KEYS.MODIFIER.SUPER, KEYS.SPECIAL.SPACE)] =                       {cmd = "noctalia msg panel-toggle launcher",                 rep = false,                desc = "Toggle Launcher"},
    [chord(KEYS.MODIFIER.SUPER, KEYS.MODIFIER.ALT, KEYS.SPECIAL.SPACE)] =    {cmd = "noctalia msg panel-toggle control-center",           rep = false,                desc = "Toogle Sidebar"},                 
    [chord(KEYS.MODIFIER.SUPER, KEYS.PUNCTUATION.PERIOD)] =                  {cmd = "noctalia msg settings-toggle",                       rep = false,                desc = "Toggle Settings"},             
    [chord(KEYS.MODIFIER.SUPER, KEYS.ALPHABET.V)] =                          {cmd = "noctalia msg panel-toggle clipboard",                rep = false,                desc = "Toggle Clipboard History"},             
    [chord(KEYS.MODIFIER.SUPER, KEYS.PUNCTUATION.COMMA)] =                   {cmd = "noctalia msg panel-toggle launcher /e",              rep = false,              desc = "Toggle Emoji Selector"},         
    [KEYS.XF86.AUDIORAISEVOLUME] =                                           {cmd = "noctalia msg volume-up",                             rep = true,                desc = "Increase Volume"},
    [KEYS.XF86.AUDIOLOWERVOLUME] =                                           {cmd = "noctalia msg volume-down",                           rep = true,                desc = "Decrease Volume"},
    [KEYS.XF86.AUDIOMUTE] =                                                  {cmd = "noctalia msg volume-mute",                           rep = false,                desc = "Toggle Mute"},
    [KEYS.XF86.AUDIOPLAY] =                                                  {cmd = "noctalia msg media toggle",                          rep = false,                desc = "Toggle Audio Play/Pause"},
    [chord(KEYS.MODIFIER.CTRL, KEYS.MODIFIER.ALT, KEYS.NAVIGATION.DELETE)] = {cmd = "noctalia msg panel-toggle session",                  rep = false,                desc = "Toggle Session Menu"},
    [chord(KEYS.MODIFIER.SUPER,  KEYS.ALPHABET.L)] =                         {cmd = "noctalia msg session lock",                          rep = false,                 desc = "Lock Session"},
    [chord(KEYS.MODIFIER.SUPER, KEYS.ALPHABET.W)] =                          {cmd = "noctalia msg wallpaper-random",                      rep = false,                desc = "Random Wallpaper"}, 
}

for keybind,call in pairs(ipc) do
    hl.bind(
        keybind,
        hl.dsp.exec_cmd(call.cmd),
        {
            description = call.desc,
            repeating = call.rep
        }
    )
end


-- 3. Windows 

hl.bind(
    chord(
        KEYS.MODIFIER.SUPER,
        KEYS.ALPHABET.Q
    ),
    hl.dsp.window.close(),
    {
        description = "Gracefully Close Window"
    }
)

hl.bind(
    chord(
        KEYS.MODIFIER.SUPER,
        KEYS.MODIFIER.SHIFT,
        KEYS.ALPHABET.Q
    ),
    hl.dsp.window.kill(),
    {
        description = "Forcefully Close Window"
    }
)

hl.bind(
    chord(
        KEYS.MODIFIER.SUPER,
        KEYS.ALPHABET.T
    ),
    hl.dsp.window.float(),
    {
        description = "Toggle Float/Tile"
    }
)

hl.bind(
    chord(
        KEYS.MODIFIER.SUPER,
        KEYS.ARROW.LEFT
    ),
    hl.dsp.focus({
        direction = "left"
    }),
    {
        description = "Focus Window Left"
    }
)

hl.bind(
    chord(
        KEYS.MODIFIER.SUPER,
        KEYS.ARROW.RIGHT
    ),
    hl.dsp.focus({
        direction = "right"
    }),
    {
        description = "Focus Window Right"
    }
)
hl.bind(
    chord(
        KEYS.MODIFIER.SUPER,
        KEYS.ARROW.UP
    ),
    hl.dsp.focus({
        direction = "up"
    }),
    {
        description = "Focus Window Up"
    }
)

hl.bind(
    chord(
        KEYS.MODIFIER.SUPER,
        KEYS.ARROW.DOWN
    ),
    hl.dsp.focus({
        direction = "down"
    }),
    {
        description = "Focus Window Down"
    }
)


hl.bind(
    chord(
     KEYS.MODIFIER.SUPER,
     KEYS.ALPHABET.F
    ),
    hl.dsp.window.fullscreen(
     { 
         mode = "maximized",
         action = "toggle"
     }
    ),
    {
        description = "Toggle Fullscreen"
    }
)


hl.bind(
  chord(
   KEYS.MODIFIER.SUPER,
   KEYS.MODIFIER.SHIFT,
   KEYS.ALPHABET.F
  ),
  hl.dsp.window.fullscreen(),
  { 
    description = "Window: Maximize" 
  }
)


hl.bind(
  chord(
   KEYS.MODIFIER.SUPER,
   KEYS.SYMBOL.BRACKETLEFT
  ),
  hl.dsp.layout("splitratio +0.1"),
  {
    repeating = true
  }
)

hl.bind(
  chord(
   KEYS.MODIFIER.SUPER,
   KEYS.SYMBOL.BRACKETRIGHT
  ),
  hl.dsp.layout("splitratio -0.1"),
  {
    repeating = true
  }
)


hl.bind(
    chord(
        KEYS.MODIFIER.SUPER,
        KEYS.MOUSE.LMB
    ),
    hl.dsp.window.drag(),
    {
        description = "Drag Window"
    }
)

hl.bind(
    chord(
        KEYS.MODIFIER.SUPER,
        KEYS.MOUSE.RMB
    ),
    hl.dsp.window.resize(),
    {
        description = "Resize Window"
    }
)

hl.bind(
    chord(
        KEYS.MODIFIER.SUPER,
        KEYS.MODIFIER.SHIFT,
        KEYS.ARROW.LEFT
    ),
    hl.dsp.window.swap({
        direction = "left"
    }),
    {
        description = "Swap Focused Window with Window to Left"
    }
)

hl.bind(
    chord(
        KEYS.MODIFIER.SUPER,
        KEYS.MODIFIER.SHIFT,
        KEYS.ARROW.RIGHT
    ),
    hl.dsp.window.swap({
        direction = "right"
    }),
    {
        description = "Swap Focused Window with Window to Right"
    }
)

hl.bind(
    chord(
        KEYS.MODIFIER.SUPER,
        KEYS.MODIFIER.SHIFT,
        KEYS.ARROW.UP
    ),
    hl.dsp.window.swap({
        direction = "up"
    }),
    {
        description = "Swap Focused Window with Window Above"
    }
)

hl.bind(
    chord(
        KEYS.MODIFIER.SUPER,
        KEYS.MODIFIER.SHIFT,
        KEYS.ARROW.DOWN
    ),
    hl.dsp.window.swap({
        direction = "down"
    }),
    {
        description = "Swap Focused Window with Window Below"
    }
)

-------------------------------------------------------------
---                WORKING WITH WORKSPACES                ---   
-------------------------------------------------------------
---

-- 4. Workspaces

local function SwitchToWorkspace(WorkspaceID) 
    hl.bind(
        chord(
            KEYS.MODIFIER.SUPER,
            tostring(WorkspaceID)
        ),
        hl.dsp.focus({
            workspace = tostring(WorkspaceID)
        }), 
        {
            description = "Switch To Workspace # " .. tostring(WorkspaceID)
        }
    )
end

local function MoveWindowToWorkspace(WorkspaceID)
     hl.bind(
            chord(
                KEYS.MODIFIER.SUPER,
                KEYS.MODIFIER.SHIFT,
                tostring(WorkspaceID)
            ),
        hl.dsp.window.move({
            workspace = tostring(WorkspaceID)
        }), 
        {
            description = "Move Window To Workspace # " .. tostring(WorkspaceID)
        }
    )
end

local function MoveWindowToWorkspaceSilently(WorkspaceID) 
    hl.bind(
        chord(
            KEYS.MODIFIER.SUPER,
            KEYS.MODIFIER.ALT,
            tostring(WorkspaceID)
        ),
        hl.dsp.window.move({
            workspace = tostring(WorkspaceID),
            follow = false,
        }), 
        {
            description = "Move Window (Silent) To Workspace # " .. tostring(WorkspaceID) 
        }
    )
end

for i = 1, 9 do
    SwitchToWorkspace(i)
end

for i = 1, 9 do
    MoveWindowToWorkspace(i)
end

for i = 1, 9 do
    MoveWindowToWorkspaceSilently(i)
end

hl.bind(
    chord(
        KEYS.MODIFIER.SUPER,
        KEYS.MODIFIER.ALT, 
        KEYS.ARROW.RIGHT
    ),
    hl.dsp.focus({
        workspace = "+1"
    }), 
    {
        description = "Switch to workspace right"
    }
)

hl.bind(
    chord(
        KEYS.MODIFIER.SUPER,
        KEYS.MODIFIER.ALT,
        KEYS.ARROW.LEFT
    ),
    hl.dsp.focus({
        workspace = "-1"
    }), 
    {
        description = "Switch to workspace left"
    }
)


hl.bind(
  chord(
    KEYS.MODIFIER.SUPER,
    KEYS.MODIFIER.ALT,
    KEYS.ALPHABET.S 
  ),
  hl.dsp.window.move(
    { 
      workspace = "special:special",
      follow = false 
    }
  ),
  {
    description = "Move Window to scratchpad"
  }
)


hl.bind(
  chord(
    KEYS.MODIFIER.SUPER,
    KEYS.ALPHABET.S 
  ),
  hl.dsp.workspace.toggle_special("special"),
  {
    description = "Workspace: Toggle scratchpad" 
  }
)

