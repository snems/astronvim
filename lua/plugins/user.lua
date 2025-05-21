-- You can also add or configure plugins by creating files in this `plugins/` folder
-- PLEASE REMOVE THE EXAMPLES YOU HAVE NO INTEREST IN BEFORE ENABLING THIS FILE
-- Here are some examples:

---@type LazySpec
return {

  { "mileszs/ack.vim", enabled = true },
  --{ "jpmcb/nvim-llama", 
  --  enabled = true,
  --  config = function() 
  --    --require('nvim-llama').setup({ debug = true, model = 'codellama:7b', }) 
  --    require('nvim-llama').setup({ debug = true, model = 'starcoder2:7b', }) 
  --  end,
  --},
  { "olimorris/codecompanion.nvim",
    enabled = true,
    config = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("codecompanion").setup({
          strategies = {
          chat = {
            adapter = "codellama",
          },
          inline = {
            adapter = "codellama",
          },
        },
        adapters = {
          codellama = function()
            return require("codecompanion.adapters").extend("ollama", {
              name = "codellama", -- Give this adapter a different name to differentiate it from the default ollama adapter
              env = {
                url = "http://192.168.82.1:12343",
                --api_key = "OLLAMA_API_KEY",
              },
              schema = {
                model = {
                  default = "codellama:7b",
                },
                --num_ctx = {
                --  default = 16384,
                --},
                --num_predict = {
                --  default = -1,
                --},
              },
            })
          end,
          codellama2 = function()
            return require("codecompanion.adapters").extend("ollama", {
              env = {
                url = "http://192.168.82.1:12343",
                --api_key = "OLLAMA_API_KEY",
              },
              headers = {
                --["Content-Type"] = "application/json",
              --  ["Authorization"] = "Bearer ${api_key}",
              },
              parameters = {
                sync = true,
              },
            })
            end,
          },
      })
    end,
  },
  {"vimwiki/vimwiki", 
    init = function() 
        vim.g.vimwiki_list = {
            {
            path = '~/Documents/vimwiki',
            syntax = 'markdown',
            ext = '.md',
            },
        }
    end, },

  -- == Examples of Adding Plugins ==

  --"andweeb/presence.nvim",
  --{
  --  "ray-x/lsp_signature.nvim",
  --  event = "BufRead",
  --  config = function() require("lsp_signature").setup() end,
  --},

  ---- == Examples of Overriding Plugins ==

  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = table.concat({
            " █████  ███████ ████████ ██████   ██████ ",
            "██   ██ ██         ██    ██   ██ ██    ██",
            "███████ ███████    ██    ██████  ██    ██",
            "██   ██      ██    ██    ██   ██ ██    ██",
            "██   ██ ███████    ██    ██   ██  ██████ ",
            "",
            "███    ██ ██    ██ ██ ███    ███",
            "████   ██ ██    ██ ██ ████  ████",
            "██ ██  ██ ██    ██ ██ ██ ████ ██",
            "██  ██ ██  ██  ██  ██ ██  ██  ██",
            "██   ████   ████   ██ ██      ██",
          }, "\n"),
        },
      },
    },
  },

  ---- You can disable default plugins as follows:
  --{ "max397574/better-escape.nvim", enabled = false },


  ---- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  --{
  --  "L3MON4D3/LuaSnip",
  --  config = function(plugin, opts)
  --    require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
  --    -- add more custom luasnip configuration such as filetype extend or custom snippets
  --    local luasnip = require "luasnip"
  --    luasnip.filetype_extend("javascript", { "javascriptreact" })
  --  end,
  --},

  --{
  --  "windwp/nvim-autopairs",
  --  config = function(plugin, opts)
  --    require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
  --    -- add more custom autopairs configuration such as custom rules
  --    local npairs = require "nvim-autopairs"
  --    local Rule = require "nvim-autopairs.rule"
  --    local cond = require "nvim-autopairs.conds"
  --    npairs.add_rules(
  --      {
  --        Rule("$", "$", { "tex", "latex" })
  --          -- don't add a pair if the next character is %
  --          :with_pair(cond.not_after_regex "%%")
  --          -- don't add a pair if  the previous character is xxx
  --          :with_pair(
  --            cond.not_before_regex("xxx", 3)
  --          )
  --          -- don't move right when repeat character
  --          :with_move(cond.none())
  --          -- don't delete if the next character is xx
  --          :with_del(cond.not_after_regex "xx")
  --          -- disable adding a newline when you press <cr>
  --          :with_cr(cond.none()),
  --      },
  --      -- disable for .vim files, but it work for another filetypes
  --      Rule("a", "a", "-vim")
  --    )
  --  end,
  --},
}
