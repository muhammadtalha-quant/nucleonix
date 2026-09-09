{pkgs, lib, ...}: {
 programs.neovim = {
 	enable = true;
	extraPackages = with pkgs; [
		ripgrep
		fd
		fzf
		curl
		tree-sitter
		gcc-unwrapped
	];
 };
  xdg.configFile."nvim" = {
    source = lib.mkForce ../dotfiles/lazyvim;
    recursive = true;
  };
}
