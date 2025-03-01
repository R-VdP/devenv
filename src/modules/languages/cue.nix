{ pkgs, config, lib, ... }:

let
  cfg = config.languages.cue;
in
{
  options.languages.cue = {
    enable = lib.mkEnableOption "Enable tools for Cue development.";

    package = lib.mkOption {
      type = lib.types.package;
      default = pkgs.cue;
      defaultText = "pkgs.cue";
      description = "The CUE package to use.";
    };
  };

  config = lib.mkIf cfg.enable {
    packages = [
      cfg.package
    ];

    enterShell = ''
      cue version
    '';
  };
}
