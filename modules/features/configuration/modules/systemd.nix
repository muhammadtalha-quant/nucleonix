{ pkgs, ... }: {
    systemd.user.services.tmux = {
        description = "tmux server daemon";
        wantedBy = [ "default.target" ];
        serviceConfig = {
            Type = "forking";
            ExecStart = "${pkgs.tmux}/bin/tmux new-session -s service -d";
            ExecStop = "${pkgs.tmux}/bin/tmux kill-server -t service";
            RemainAfterExit = "yes";
        };
    };
}
