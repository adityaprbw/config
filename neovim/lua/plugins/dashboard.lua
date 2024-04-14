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

    -- Set button section values
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

    -- Function to get a random quote with centered formatting
    local function get_random_quote()
    local quotes = {
    "Doubt my intentions as you please, in the end, only the victor will be remembered. - Yu Zhong",
    "Knowing is not enough, we must apply. - Bruce Lee",
    "Believe you can and you're halfway there. - Theodore Roosevelt",
    "Keberhasilan bukanlah milik orang yang pintar, tapi milik mereka yang senantiasa berusaha. - B.J Habibie",
    "I may not be there yet, but I'm closer than I was yesterday. - Unknown",
    "Vision without action is a daydream. - Unknown"
    }

    local quote = quotes[math.random(#quotes)]
      local quote_length = #quote

      -- Calculate padding based on quote length and desired width (80 characters)
      local padding = (80 - quote_length) / 2

      -- Create padded quote string

      local padded_quote = string.rep(" ", padding) .. quote .. string.rep(" ", padding)

      return padded_quote
    end

        -- Update footer section function to center content
    dashboard.section.footer.val = function()
      local date = os.date('%A, %B %d, %Y') -- Format date as requested
      local quote = get_random_quote()

      -- Calculate total width for centered alignment (80 characters)
      local total_width = 80

      -- Measure date string width in bytes
      local date_width = string.len(date)

      -- Calculate padding based on total width and date width
      local padding_date = (total_width - date_width) / 2

      -- Create padded date string
      local padded_date = string.rep(" ", padding_date) .. date .. string.rep(" ", padding_date)

      -- Combine centered date and quote
      local footer_text = padded_date .. "\n\n" .. quote
      return footer_text
    end

    require('alpha').setup(dashboard.opts)
  end,
  requires = { 'nvim-lua/plenary.nvim', 'kyazdani42/nvim-web-devicons' },

}
