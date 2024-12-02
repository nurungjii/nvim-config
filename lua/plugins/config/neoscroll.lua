neoscroll = require('neoscroll')
local keymap = {
  ["<C-u>"] = function() neoscroll.ctrl_u({ duration = 250 }) end;
  ["<C-d>"] = function() neoscroll.ctrl_d({ duration = 250 }) end;
  -- ["<C-u>"] = function() neoscroll.scroll(-0.3, { move_cursor=false; duration = 100 }) end;
  -- ["<C-d>"] = function() neoscroll.scroll(0.3, { move_cursor=false; duration = 100 }) end;
}
local modes = { 'n', 'v', 'x' }
for key, func in pairs(keymap) do
  vim.keymap.set(modes, key, func)
end
