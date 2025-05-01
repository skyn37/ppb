return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate", -- Automatically run :TSUpdate to keep parsers up-to-date
    config = function()
        require("nvim-treesitter.configs").setup({
            -- A list of parser names, or "all"
            ensure_installed = { "vimdoc", "javascript", "typescript", "c", "lua", "rust", "html", "cpp" },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering a buffer
            auto_install = true,

            highlight = {
                -- `false` will disable the whole extension
                enable = true,

                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- May slow down the editor if enabled.
                additional_vim_regex_highlighting = false,
            },
        })
    end,
}