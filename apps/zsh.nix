#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
#░        ░░░      ░░░  ░░░░  ░
#▒▒▒▒▒▒  ▒▒▒  ▒▒▒▒▒▒▒▒  ▒▒▒▒  ▒
#▓▓▓▓  ▓▓▓▓▓▓      ▓▓▓        ▓
#██  █████████████  ██  ████  █
#█        ███      ███  ████  █
#██████████████████████████████                              

{ config, lib, pkgs, ... }:

{
  programs.zoxide.enable = true;
  programs.zoxide.enableZshIntegration = true;

  programs.zsh = {
    enable = true;
    autocd = true;
    dotDir = ".config/zsh";
    autosuggestion.enable = true;
    enableCompletion = true;
    shellAliases = {
      sl = "eza";
      ls = "eza";
      l = "eza -l";
      la = "eza -la";
      ip = "ip --color=auto";
      cd = "z";
      nixb = "sudo nixos-rebuild switch --flake /etc/nixos#default";
      nixu = "sudo nix flake update /etc/nixos/";
      nixep = "sudoedit /etc/nixos/programs.nix";
      nixef = "sudoedit /etc/nixos/flake.nix";
      nixe = "sudoedit /etc/nixos/configuration.nix";
      se = "sudoedit";
    };
    

    initExtra = ''
      
      bindkey '^ ' autosuggest-accept
      AGKOZAK_CMD_EXEC_TIME=5
      AGKOZAK_COLORS_CMD_EXEC_TIME='yellow'
      AGKOZAK_COLORS_PROMPT_CHAR='magenta'
      AGKOZAK_CUSTOM_SYMBOLS=( '⇣⇡' '⇣' '⇡' '+' 'x' '!' '>' '?' )
      AGKOZAK_MULTILINE=1
      AGKOZAK_BLANK_LINES=1
      AGKOZAK_PROMPT_CHAR=( ❯ ❯ ❮ )
      microfetch
      #eval $(thefuck --alias)
      #
      #'';

    plugins = with pkgs; [
      {
        name = "agkozak-zsh-prompt";
        src = fetchFromGitHub {
          owner = "agkozak";
          repo = "agkozak-zsh-prompt";
          rev = "v3.7.0";
          sha256 = "1iz4l8777i52gfynzpf6yybrmics8g4i3f1xs3rqsr40bb89igrs";
        };
        file = "agkozak-zsh-prompt.plugin.zsh";
      }
      {
        name = "formarks";
        src = fetchFromGitHub {
          owner = "wfxr";
          repo = "formarks";
          rev = "8abce138218a8e6acd3c8ad2dd52550198625944";
          sha256 = "1wr4ypv2b6a2w9qsia29mb36xf98zjzhp3bq4ix6r3cmra3xij90";
        };
        file = "formarks.plugin.zsh";
      }
      {
        name = "zsh-syntax-highlighting";
        src = fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "0.6.0";
          sha256 = "0zmq66dzasmr5pwribyh4kbkk23jxbpdw4rjxx0i7dx8jjp2lzl4";
        };
        file = "zsh-syntax-highlighting.zsh";
      }
     ];
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}

