return {
  {
    "mfussenegger/nvim-jdtls",
    dependencies = { "folke/which-key.nvim" },
    ft = { "java" },
    config = function()
      local jdtls = require("jdtls")
      local home = os.getenv("HOME") or os.getenv("USERPROFILE")

      local os_config = "linux"
      if vim.fn.has("mac") == 1 then
        os_config = "mac"
      elseif vim.fn.has("win32") == 1 then
        os_config = "win"
      end

      -- mason instalation paths
      local mason_path = home .. "/.local/share/nvim/mason/packages/jdtls"
      local plugins_path = mason_path .. "/plugins/"
      local config_path = mason_path .. "/config_" .. os_config

      -- Dynamically find te laucher JAR file
      local launcher_jar = vim.fn.glob(plugins_path .. "org.eclipse.equinox.laucher_*.jar")

      -- Unique workspace path based on current project name
      local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
      local workspace_dir = home .. "/.cache/jdtls/workspace/" .. project_name

      -- main JDTLS configutation
      local config = {
        cmd = {
          "java",
          "-Declipse.application=org.eclipse.jdt.ls.core.id1",
          "-Dosgi.bundles.defaultStartLevel=4",
          "-Declipse.product=org.eclipse.jdt.ls.core.product",
          "-Dlog.level=ALL",
          "-Xmx1g",
          "--add-modules=ALL-SYSTEM",
          "--add-opens",
          "java.base/java.util=ALL-UNNAMED",
          "--add-opens",
          "java.base/java.lang=ALL-UNNAMED",
          "-jar",
          launcher_jar,
          "-configuration",
          config_path,
          "-data",
          workspace_dir,
        },
        root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      }
      local on_attach = function(client, bufnr)
        local bufopts = { remap = false, silent = true, buffer = bufnr }
        vim.keymap.set("n", "<leader>oi", jdtls.organize_imports, bufopts)
        vim.keymap.set("n", "<leader>cxv", jdtls.extract_variable, bufopts)
      end
      config["on_attach"] = on_attach

      jdtls.start_or_attach(config)
    end,
  },
}
