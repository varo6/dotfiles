-- Example structure from LazyVim docs
return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    table.insert(
      opts.sections.lualine_x,
      2, -- Or another position
      LazyVim.lualine.status(LazyVim.config.icons.kinds.Copilot, function()
        -- This function tries to get the status
        local clients = package.loaded["copilot"] and LazyVim.lsp.get_clients({ name = "copilot", bufnr = 0 }) or {}
        if #clients > 0 then
          -- The potential point of failure:
          local status = require("copilot.api").status.data.status
          -- Determine icon based on status
          return (status == "InProgress" and "pending") or (status == "Warning" and "error") or "ok"
        end
      end)
    )
  end,
}
