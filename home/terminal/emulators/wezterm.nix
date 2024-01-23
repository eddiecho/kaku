{
  inputs,
  pkgs,
  ...
}: {
  programs.wezterm = {
    enable = true;
    package = inputs.self.packages.${pkgs.system}.wezterm;
    extraConfig = ''
      local wezterm = require ("wezterm")

      local function font_with_fallback(name, params)
        local names = { name, "Material Symbols Outlined"}
        return wezterm.font_with_fallback(names, params)
      end

      local font_name = "Maple Mono SC NF"

      return {
        font_size = 10,

       -- Font config
        font = font_with_fallback(font_name),
        font_rules = {
           {
             italic = true,
             font = font_with_fallback(font_name, { italic = true }),
           },
           {
             italic = false,
             font = font_with_fallback(font_name, { bold = true }),
           },
           {
             intensity = "Bold",
             font = font_with_fallback(font_name, { bold = true }),
           },
         },

        color_scheme = "tokyonight",
        window_background_opacity = 0.9,
        warn_about_missing_glyphs = false,
        enable_scroll_bar = false,
        enable_tab_bar = false,
        scrollback_lines = 10000,
        window_padding = {
          left = 25,
          right = 25,
          top = 25,
          bottom = 25,
        },
        enable_wayland = true,
        check_for_updates = false,
        default_cursor_style = "SteadyBar",
        automatically_reload_config = true,

        disable_default_key_bindings = true,
        keys = {
          {
            key = "q",
            mods = "CTRL",
            action = wezterm.action({ CloseCurrentPane = { confirm = false } }),
          },
          {
            key = "v",
            mods = "CTRL|SHIFT",
            action = wezterm.action({ PasteFrom = "Clipboard" }),
          },
          {
            key = "c",
            mods = "CTRL|SHIFT",
            action = wezterm.action({ CopyTo = "ClipboardAndPrimarySelection" }),
          },
          },
            window_close_confirmation = "NeverPrompt",
          }
    '';
  };
}
