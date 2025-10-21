-- return {
--   "thesimonho/kanagawa-paper.nvim",
--   lazy = false,          -- load at startup
--   priority = 1000,       -- load before other UI plugins
--   -- configure BEFORE loading the colorscheme
--   opts = {
--     -- example tweaks:
--     -- transparent = false,
--     -- undercurl = true,
--     -- diag_background = true,
--   },
--   -- Apply the theme early in startup
--   init = function()
--     vim.cmd.colorscheme("kanagawa-paper-ink")   -- or "kanagawa-paper-canvas"
--   end,
-- }



return {
  "thesimonho/kanagawa-paper.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    -- Load the theme with error handling
    local ok, _ = pcall(vim.cmd.colorscheme, "kanagawa-paper-ink")
    if not ok then
      -- Fallback if kanagawa-paper fails to load
      vim.notify("Failed to load kanagawa-paper-ink, using fallback", vim.log.levels.WARN)
      vim.cmd.colorscheme("default")
    end
  end,
}
