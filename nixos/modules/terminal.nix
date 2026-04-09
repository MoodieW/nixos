{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    config = {
      user.name = "Wayne Moodie";
      user.email = "moodiewayne@gmail.com";
    };
  };
  programs.ssh.startAgent = true;

  users.users.moodie.openssh.authorizedKeys.keys = [
  # your public key here
  ];

  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;
  programs.fish.shellInit = ''
    starship init fish | source
  '';
  programs.bash = {
  interactiveShellInit = ''
    if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
    then
      shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
      exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
    fi
  '';
  };  
  environment.systemPackages = with pkgs; [
    nodejs
    jq
    atuin
    git
    wl-clipboard
    eza
    yazi
    lazygit
    fzf
    ripgrep
    fd
    bat
    zoxide
    tree
    stow
    starship
    spotify-player
    opencode
    fastfetch
    glow
    docker
    btop
    # fish
    fish
    
    #terminal
    kitty

    #eitor
    helix
    
    # Baseline lsp fand formatter for nix
    nixd
    nixfmt
  ];

  
  # set HELIX as default editor system-wide
  environment.variables = {
    EDITOR = "hx";
    VISUAL = "hx";
    NPM_CONFIG_PREFIX = "$HOME/.npm-global";
  };
}
