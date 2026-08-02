{ pkgs, pkgs-unstable, ... }: {
    programs.yazi = {
        enable = true;
        enableFishIntegration = true;
        plugins = {
            ouch = pkgs.yaziPlugins.ouch;
            smart-enter = pkgs.yaziPlugins.smart-enter;
            omni-trash = pkgs-unstable.yaziPlugins.omni-trash;
        };
        settings = {
            mgr = {
                sort_by = "mtime";
                sort_sensitive = false;
                sort_dir_first = true;
                linemode = "permissions";
                show_hidden = false;
                show_symlink = true;
            };
            preview.wrap = "no";
            plugin.prepend_previewers = [
                {
                    mime = "application/{*zip,tar,bzip2,7z*,rar,xz,zstd,java-archive}";
                    run = "ouch";
                }
            ];
            opener = {
                extract = [
                    {
                        run = "ouch d -y \"$@\"";
                        desc = "Extract here with ouch";
                        for = "unix";
                    }
                ];
            };
        };
        keymap = {
            mgr.prepend_keymap = [
                {
                    on = [ "C" ];
                    run = "plugin ouch";
                }
                {
                    on = [ "<Enter>" ];
                    run = "plugin smart-enter";
                }
                {
                    on = [ "R" ];
                    run = "plugin omni-trash";
                }
            ];
        };
    };
}
