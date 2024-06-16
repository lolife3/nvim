function Colors(color)
	color = color or "melange"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none", italic = false })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none", italic = false })

end

function MelangeColors()
    vim.g.melange_enable_font_variants = 0    -- disable font variants
    require("lush")                           -- make sure Lush is installed
    require("melange.build").build()          -- Compile to vimscript
end


return {
    {
        "folke/tokyonight.nvim",
		dependencies = {
			"rktjmp/lush.nvim",
			},
        config = function()
            require("tokyonight").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
                transparent = true, -- Enable this to disable setting the background color
                terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
                styles = {
                    -- Style to be applied to different syntax groups
                    -- Value is any valid attr-list value for `:help nvim_set_hl`
                    comments = { italic = false },
                    keywords = { italic = false },
                    -- Background styles. Can be "dark", "transparent" or "normal"
                    sidebars = "dark", -- style for sidebars, see below
                    floats = "dark", -- style for floating windows
                },
            })
        end
    },

	{
		"savq/melange-nvim",
		name = "melange",
		config = function()

			vim.cmd("colorscheme melange")


			MelangeColors()
			Colors()
	end },


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

			vim.cmd("colorscheme rose-pine")


			Colors()
	end },

}
