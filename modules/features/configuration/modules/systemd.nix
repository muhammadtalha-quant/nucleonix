{ pkgs, ... }: {
    systemd.user.services.tmux = {
        description = "tmux server daemon";
        wantedBy = [ "default.target" ];
        serviceConfig = {
            Type = "forking";
            ExecStart = "${pkgs.tmux}/bin/tmux start-server";
            ExecStop = "${pkgs.tmux}/bin/tmux kill-server";
            Restart = "on-failure";
        };
    };
}
