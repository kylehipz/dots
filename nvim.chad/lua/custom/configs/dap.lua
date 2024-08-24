local js_based_languages = {
  "typescript",
  "javascript",
  "typescriptreact",
  "javascriptreact",
  "vue",
}

local M = {}

function M.dap_config()
  local dap = require("dap")

  for _, language in ipairs(js_based_languages) do
    dap.configurations[language] = {
      -- Debug single nodejs files
      {
        type = "pwa-node",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        cwd = "${workspaceFolder}",
        sourceMaps = true
      },
      -- Attach to a running nodejs process
      {
        type = "pwa-node",
        request = "attach",
        name = "Attach",
        -- processId = require("dap.utils").pick_process,
        cwd = "${workspaceFolder}",
        sourceMaps = true,
      },
      -- Launch.json configs
      {
        type = "",
        request = "launch",
        name = "------ From launch.json configs --------",
      },
    }
  end
end

function M.load_debug_config()
    if vim.fn.filereadable(".vscode/launch.json") then
      local dap_vscode = require("dap.ext.vscode")

      dap_vscode.load_launchjs(nil, {
        ["pwa-node"] = js_based_languages,
        ["node"] = js_based_languages,
        ["chrome"] = js_based_languages,
        ["pwa-chrome"] = js_based_languages,
      })
    end
end

return M
