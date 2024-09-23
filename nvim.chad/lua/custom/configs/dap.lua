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

  dap.adapters.php = {
    type = "executable",
    command = "node",
    args = { os.getenv("HOME") .. "/vscode-php-debug/out/phpDebug.js" }
  }

  dap.configurations.php = {
      {
          type = "php",
          request = "launch",
          name = "Launch current file",
          port = 9003,
          cwd = "${workspaceFolder}",
        program = "${file}",
        runtimeExecutable = "php"
      },
      {
          type = "php",
          request = "launch",
          name = "Listen for Xdebug",
          port = 9003,
          pathMappings = {
            ["/media/psf/bitdefender/console"] = os.getenv("HOME") .. "/projects/bitdefender/console"
          }
      }
  }

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


  -- PHP

end

function M.load_debug_config()
    local dap_vscode = require("dap.ext.vscode")

    if vim.fn.filereadable(".vscode/launch.json") then

      dap_vscode.load_launchjs(nil, {
        ["pwa-node"] = js_based_languages,
        ["node"] = js_based_languages,
        ["chrome"] = js_based_languages,
        ["pwa-chrome"] = js_based_languages,
      })
    end

    -- dap_vscode.load_launchjs(nil, {
    --   ["php"] = {"php"}
    -- })
end

return M
