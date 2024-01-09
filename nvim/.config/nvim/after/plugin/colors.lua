-- Colorscheme
-- Apply terminal colors
vim.opt.termguicolors = true

-- Change gruvbox style to match terminal colors

-- Don't show end of buffers
vim.g.gruvbox_material_show_eob=0

vim.cmd.colorscheme("gruvbox-material")

-- Change gruvbox-material x neo-tree config to match the colors between them
vim.cmd([[
highlight! link NeoTreeNormal Normal
highlight! link NeoTreeEndOfBuffer NeoTreeVertSplit
]])
