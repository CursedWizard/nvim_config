local Util = require("lazyvim.util")

return {
  -- fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false, -- telescope did only one release, so use HEAD for now
    keys = {
      { "<leader>sf", Util.telescope("files"), desc = "Search Files (root dir)" },
      { "<leader>sF", Util.telescope("files", { cwd = false }), desc = "Search Files (cwd)" },
    },
  },
}
