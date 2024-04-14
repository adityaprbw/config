return {
    'ribru17/bamboo.nvim',
    lazy = false,
    priority = 1000,
    name = "bamboo",
    config = function()
    require("bamboo").setup()
    vim.cmd.colorscheme "bamboo"
    end
}
