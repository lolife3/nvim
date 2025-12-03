function Colors(color)
    require("lush")

    color = color or "melange"
    vim.cmd.colorscheme(color)

    vim.g.melange_enable_font_variants = 0

    vim.api.nvim_set_hl(0, "Normal", { bg = "none", italic = false })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none", italic = false })
end

return {
    {
        "folke/tokyonight.nvim",
        dependencies = {
            "rktjmp/lush.nvim",
        },
        config = function()
            require("tokyonight").setup({
                style = "night",        -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
                transparent = true,     -- Enable this to disable setting the background color
                terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
                styles = {
                    comments = { italic = false },
                    keywords = { italic = false },
                    sidebars = "dark", -- style for sidebars, see below
                    floats = "dark",   -- style for floating windows
                },
            })
        end
    },

    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require('rose-pine').setup({
                disable_background = true,
                styles = {
                    italic = false,
                },
            })
        end
    },

    {
        "savq/melange-nvim",
        name = "melange",
        config = function()
            vim.cmd.colorscheme('melange')
            Colors()
        end
    },
}
