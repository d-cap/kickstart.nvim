palette = {
  bg           = "#0d1221",
  bg_alt       = "#111837",
  fg           = "#cdd6f4",
  fg_dim       = "#8a9ab8",
  green        = "#00c878",
  green_dim    = "#00a362",
  blue         = "#4d9ef8",
  blue_dim     = "#1e5fb8",
  blue_ex_dim  = "#0e3f98",
  magenta      = "#b455ac",
  magenta_dim  = "#9a3396",
  cyan         = "#00b4c8",
  gray         = "#637085",
  red          = "#e05c6a",
}

  local p = palette
  vim.cmd("highlight clear")
  if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end
  vim.o.background = "dark"
  vim.g.colors_name = "elixir-bootlin"

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- Editor
  hi("Normal",          { fg = p.fg,        bg = p.bg })
  hi("NormalFloat",     { fg = p.fg,        bg = p.bg_alt })
  hi("NormalNC",        { fg = p.fg_dim,    bg = p.bg })
  hi("ColorColumn",     { bg = p.bg_alt })
  hi("CursorLine",      { bg = p.bg_alt })
  hi("CursorLineNr",    { fg = p.green,     bold = true })
  hi("LineNr",          { fg = p.gray })
  hi("SignColumn",      { fg = p.gray,      bg = p.bg })
  hi("VertSplit",       { fg = p.navy,      bg = p.bg })
  hi("WinSeparator",    { fg = p.navy,      bg = p.bg })
  hi("Folded",          { fg = p.fg_dim,    bg = p.bg_alt })
  hi("FoldColumn",      { fg = p.gray,      bg = p.bg })
  hi("EndOfBuffer",     { fg = p.gray })
  hi("NonText",         { fg = p.gray })
  hi("Whitespace",      { fg = p.gray })
  hi("MatchParen",      { fg = p.magenta,   bold = true, underline = true })

  -- Selection / Search
  hi("Visual",          { bg = p.bg_alt })
  hi("Search",          { fg = p.bg,        bg = p.green })
  hi("IncSearch",       { fg = p.bg,        bg = p.magenta })
  hi("CurSearch",       { fg = p.bg,        bg = p.magenta })
  hi("Substitute",      { fg = p.bg,        bg = p.magenta })

  -- Status / Tab
  hi("StatusLine",      { fg = p.fg,        bg = p.bg_alt })
  hi("StatusLineNC",    { fg = p.fg_dim,    bg = p.bg_alt })
  hi("TabLine",         { fg = p.fg_dim,    bg = p.bg_alt })
  hi("TabLineFill",     { bg = p.bg_alt })
  hi("TabLineSel",      { fg = p.green,     bg = p.bg,   bold = true })

  -- Popup / Menu
  hi("Pmenu",           { fg = p.fg,        bg = p.bg_alt })
  hi("PmenuSel",        { fg = p.bg,        bg = p.green })
  hi("PmenuSbar",       { bg = p.bg_alt })
  hi("PmenuThumb",      { bg = p.navy })
  hi("WildMenu",        { fg = p.bg,        bg = p.green })

  -- Diagnostics
  hi("DiagnosticError",          { fg = p.red })
  hi("DiagnosticWarn",           { fg = p.magenta })
  hi("DiagnosticInfo",           { fg = p.cyan })
  hi("DiagnosticHint",           { fg = p.green_dim })
  hi("DiagnosticUnderlineError", { sp = p.red,     underline = true })
  hi("DiagnosticUnderlineWarn",  { sp = p.magenta, underline = true })

  -- Gitsigns
  hi("GitSignsAdd",     { fg = p.green })
  hi("GitSignsChange",  { fg = p.cyan })
  hi("GitSignsDelete",  { fg = p.red })

  -- Syntax (legacy)
  hi("Comment",         { fg = p.gray,      italic = true })
  hi("Constant",        { fg = p.green })
  hi("String",          { fg = p.green })
  hi("Character",       { fg = p.green })
  hi("Number",          { fg = p.magenta })
  hi("Boolean",         { fg = p.magenta,   bold = true })
  hi("Float",           { fg = p.magenta })
  hi("Identifier",      { fg = p.fg })
  hi("Function",        { fg = p.cyan })
  hi("Statement",       { fg = p.magenta,   bold = true })
  hi("Keyword",         { fg = p.magenta,   bold = true })
  hi("Conditional",     { fg = p.magenta,   bold = true })
  hi("Repeat",          { fg = p.magenta,   bold = true })
  hi("Label",           { fg = p.magenta })
  hi("Operator",        { fg = p.fg_dim })
  hi("Exception",       { fg = p.red })
  hi("PreProc",         { fg = p.green_dim })
  hi("Include",         { fg = p.green_dim })
  hi("Define",          { fg = p.green_dim })
  hi("Macro",           { fg = p.green_dim })
  hi("Type",            { fg = p.cyan })
  hi("StorageClass",    { fg = p.magenta })
  hi("Structure",       { fg = p.cyan })
  hi("Typedef",         { fg = p.cyan })
  hi("Special",         { fg = p.magenta_dim })
  hi("Delimiter",       { fg = p.fg_dim })
  hi("Error",           { fg = p.red,       bold = true })
  hi("Todo",            { fg = p.bg,        bg = p.magenta, bold = true })

  -- Treesitter
  hi("@keyword",               { fg = p.magenta,   bold = true })
  hi("@keyword.return",        { fg = p.magenta,   bold = true })
  hi("@keyword.function",      { fg = p.magenta,   bold = true })
  hi("@keyword.operator",      { fg = p.magenta })
  hi("@conditional",           { fg = p.magenta,   bold = true })
  hi("@repeat",                { fg = p.magenta,   bold = true })
  hi("@type",                  { fg = p.cyan })
  hi("@type.builtin",          { fg = p.cyan,      bold = true })
  hi("@function",              { fg = p.cyan })
  hi("@function.builtin",      { fg = p.cyan,      bold = true })
  hi("@function.call",         { fg = p.cyan })
  hi("@method",                { fg = p.cyan })
  hi("@method.call",           { fg = p.cyan })
  hi("@string",                { fg = p.green })
  hi("@string.escape",         { fg = p.magenta_dim })
  hi("@number",                { fg = p.magenta })
  hi("@float",                 { fg = p.magenta })
  hi("@boolean",               { fg = p.magenta,   bold = true })
  hi("@constant",              { fg = p.green })
  hi("@constant.builtin",      { fg = p.green,     bold = true })
  hi("@variable",              { fg = p.fg })
  hi("@variable.builtin",      { fg = p.fg_dim,    italic = true })
  hi("@parameter",             { fg = p.fg })
  hi("@field",                 { fg = p.fg })
  hi("@property",              { fg = p.fg })
  hi("@comment",               { fg = p.gray,      italic = true })
  hi("@operator",              { fg = p.fg_dim })
  hi("@punctuation.delimiter", { fg = p.fg_dim })
  hi("@punctuation.bracket",   { fg = p.fg_dim })
  hi("@include",               { fg = p.green_dim })
  hi("@preproc",               { fg = p.green_dim })
  hi("@namespace",             { fg = p.cyan })
  hi("@tag",                   { fg = p.magenta })
  hi("@tag.attribute",         { fg = p.green })
  hi("@tag.delimiter",         { fg = p.fg_dim })

  -- LSP semantic tokens
  hi("@lsp.type.function",   { fg = p.cyan })
  hi("@lsp.type.method",     { fg = p.cyan })
  hi("@lsp.type.keyword",    { fg = p.magenta,   bold = true })
  hi("@lsp.type.type",       { fg = p.cyan })
  hi("@lsp.type.class",      { fg = p.cyan })
  hi("@lsp.type.struct",     { fg = p.cyan })
  hi("@lsp.type.enum",       { fg = p.cyan })
  hi("@lsp.type.enumMember", { fg = p.fg })
  hi("@lsp.type.variable",   { fg = p.fg })
  hi("@lsp.type.parameter",  { fg = p.fg })
  hi("@lsp.type.property",   { fg = p.fg })
  hi("@lsp.type.macro",      { fg = p.green_dim })
  hi("@lsp.type.namespace",  { fg = p.cyan })
  hi("@lsp.type.comment",    { fg = p.gray,      italic = true })
  hi("@lsp.type.string",     { fg = p.green })
  hi("@lsp.type.number",     { fg = p.magenta })
  hi("@lsp.mod.deprecated",  { strikethrough = true })

  -- Telescope
  hi("TelescopeBorder",       { fg = p.navy })
  hi("TelescopeNormal",       { fg = p.fg,      bg = p.bg })
  hi("TelescopeSelection",    { fg = p.bg,      bg = p.green })
  hi("TelescopeMatching",     { fg = p.magenta, bold = true })
  hi("TelescopePromptPrefix", { fg = p.green })

  -- nvim-cmp
  hi("CmpItemAbbr",      { fg = p.fg })
  hi("CmpItemAbbrMatch", { fg = p.green,  bold = true })
  hi("CmpItemKind",      { fg = p.cyan })
  hi("CmpItemMenu",      { fg = p.fg_dim })

