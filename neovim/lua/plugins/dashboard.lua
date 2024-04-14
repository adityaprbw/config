-- init.lua
return {
  'goolord/alpha-nvim',
  config = function()
    local alpha = require'alpha'
    local dashboard = require'alpha.themes.dashboard'

    dashboard.section.header.val = {
      "                               ",
      "          |  o                 ",
      "  __,   __|    _|_        __,  ",
      " /  |  /  |  |  |  |   | /  |  ",
      " \\_/|_/\\_/|_/|_/|_/ \\_/|/\\_/|_/",
      "                      /|       ",
      "                      \\|       ",
    }

  dashboard.section.buttons.val = {
      dashboard.button("f", " " .. " Find file", ":Telescope find_files<CR>"),
      dashboard.button("e", " " .. " New file", ":ene <BAR> startinsert<CR>"),
      dashboard.button("p", " " .. " Projects", ":Telescope projects<CR>"),
      dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles<CR>"),
      dashboard.button("t", " " .. " Find text", ":Telescope live_grep<CR>"),
      dashboard.button("c", " " .. " Configuration", ":e $MYVIMRC<CR>"),
      dashboard.button("u", " " .. " Update", ":PackerSync<CR>"),
      dashboard.button("q", " " .. " Quit", ":qa<CR>"),
    }

    local function get_random_quote()
      local quotes = {
        "Doubt my intentions as you please, in the end, only the victor will be remembered. - Yu Zhong",
        "Knowing is not enough, we must apply. - Bruce Lee",
        "Believe you can and you're halfway there. - Theodore Roosevelt",
        "Keberhasilan bukanlah milik orang yang pintar, tapi milik mereka yang senantiasa berusaha. - B.J Habibie",
        "I may not be there yet, but I'm closer than I was yesterday. - Unknown",
        "Vision without action is a daydream. - Unknown"
      }
      return quotes[math.random(#quotes)]
    end

    dashboard.section.footer.val = function()
      local date = os.date('%A, %B %d, %Y')
      local quote = get_random_quote()
      local footer_text = string.format('\t\t\t\t\t\t\t\t\t\t\t\t%s', date)
      local quote_text = string.format('\n\n%s', quote)
      return footer_text .. quote_text
    end

        require('alpha').setup(dashboard.opts)
  end,
  requires = { 'nvim-lua/plenary.nvim', 'kyazdani42/nvim-web-devicons' },

   }
