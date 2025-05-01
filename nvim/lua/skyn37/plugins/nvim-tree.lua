return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons", -- Optional for file icons
    },
    config = function()
        -- Enable `nvim-web-devicons`
        require("nvim-web-devicons").setup({
            default = true, -- Enable default icons
        })

        -- Setup `nvim-tree`
        require("nvim-tree").setup({
            git = {
                enable = true, -- Show git status in the file tree
                ignore = false, -- Ignore files in gitignore
            },
            view = {
            --    float = {
            --        enable = true, -- Enable floating window
            --        open_win_config = {
            --            relative = "editor",
            --            border = "rounded",
            --            width = 50,
            --            height = 30,
            --            row = 1,
            --            col = 1,
            --        }
            --    },
                width = 30, -- Set the width of the file tree
                side = "left", -- File tree on the left
                number = true, -- Enable absolute line numbers
                relativenumber = true, -- Enable relative line numbers
                cursorline = true, -- Highlight the current line
            },
            renderer = {
                highlight_git = true, -- Highlight git status
                icons = {
                    show = {
                        git = true,
                        folder = true,
                        file = true,
                        folder_arrow = true,
                    },
                },
            },
            filters = {
                dotfiles = false, -- Show hidden files (dotfiles)
                custom = {},
            },
            hijack_directories = {
                enable = true,
                auto_open = true, -- Automatically open the tree in directories
            },
            sync_root_with_cwd = true, -- Sync the tree root with the current working directory
            update_focused_file = {
                enable = true, -- Update the focused file in the tree
                update_root = true, -- Change the root to match the file's directory
            },
        })

    end,
    keys = {
        { "<leader>e", ":NvimTreeToggle<CR>", desc = "Toggle File Tree" }, -- Toggle nvim-tree
        { "<leader>r", ":NvimTreeRefresh<CR>", desc = "Refresh File Tree" }, -- Refresh file tree
        { "<leader>n", ":NvimTreeFindFile<CR>", desc = "Find Current File" }, -- Find current file in tree
    },
}

--gt	Move to the next tab
--gT	Move to the previous tab
--Ngt	Move to tab number N (e.g., 2gt moves to tab 2)
-- bindinggs
--`<C-]>`           CD                         |nvim-tree-api.tree.change_root_to_node()|
--`<C-e>`           Open: In Place             |nvim-tree-api.node.open.replace_tree_buffer()|
--`<C-k>`           Info                       |nvim-tree-api.node.show_info_popup()|
--`<C-r>`           Rename: Omit Filename      |nvim-tree-api.fs.rename_sub()|
--`<C-t>`           Open: New Tab              |nvim-tree-api.node.open.tab()|
--`<C-v>`           Open: Vertical Split       |nvim-tree-api.node.open.vertical()|
--`<C-x>`           Open: Horizontal Split     |nvim-tree-api.node.open.horizontal()|
--`<BS>`            Close Directory            |nvim-tree-api.node.navigate.parent_close()|
--`<CR>`            Open                       |nvim-tree-api.node.open.edit()|
--`<Tab>`           Open Preview               |nvim-tree-api.node.open.preview()|
--`>`               Next Sibling               |nvim-tree-api.node.navigate.sibling.next()|
--`<`               Previous Sibling           |nvim-tree-api.node.navigate.sibling.prev()|
--`.`               Run Command                |nvim-tree-api.node.run.cmd()|
--`-`               Up                         |nvim-tree-api.tree.change_root_to_parent()|
--`a`               Create File Or Directory   |nvim-tree-api.fs.create()|
--`bd`              Delete Bookmarked          |nvim-tree-api.marks.bulk.delete()|
--`bt`              Trash Bookmarked           |nvim-tree-api.marks.bulk.trash()|
--`bmv`             Move Bookmarked            |nvim-tree-api.marks.bulk.move()|
--`B`               Toggle Filter: No Buffer   |nvim-tree-api.tree.toggle_no_buffer_filter()|
--`c`               Copy                       |nvim-tree-api.fs.copy.node()|
--`C`               Toggle Filter: Git Clean   |nvim-tree-api.tree.toggle_git_clean_filter()|
--`[c`              Prev Git                   |nvim-tree-api.node.navigate.git.prev()|
--`]c`              Next Git                   |nvim-tree-api.node.navigate.git.next()|
--`d`               Delete                     |nvim-tree-api.fs.remove()|
--`D`               Trash                      |nvim-tree-api.fs.trash()|
--`E`               Expand All                 |nvim-tree-api.tree.expand_all()|
--`e`               Rename: Basename           |nvim-tree-api.fs.rename_basename()|
--`]e`              Next Diagnostic            |nvim-tree-api.node.navigate.diagnostics.next()|
--`[e`              Prev Diagnostic            |nvim-tree-api.node.navigate.diagnostics.prev()|
--`F`               Live Filter: Clear         |nvim-tree-api.live_filter.clear()|
--`f`               Live Filter: Start         |nvim-tree-api.live_filter.start()|
--`g?`              Help                       |nvim-tree-api.tree.toggle_help()|
--`gy`              Copy Absolute Path         |nvim-tree-api.fs.copy.absolute_path()|
--`ge`              Copy Basename              |nvim-tree-api.fs.copy.basename()|
--`H`               Toggle Filter: Dotfiles    |nvim-tree-api.tree.toggle_hidden_filter()|
--`I`               Toggle Filter: Git Ignore  |nvim-tree-api.tree.toggle_gitignore_filter()|
--`J`               Last Sibling               |nvim-tree-api.node.navigate.sibling.last()|
--`K`               First Sibling              |nvim-tree-api.node.navigate.sibling.first()|
--`L`               Toggle Group Empty         |nvim-tree-api.node.open.toggle_group_empty()|
--`M`               Toggle Filter: No Bookmark |nvim-tree-api.tree.toggle_no_bookmark_filter()|
--`m`               Toggle Bookmark            |nvim-tree-api.marks.toggle()|
--`o`               Open                       |nvim-tree-api.node.open.edit()|
--`O`               Open: No Window Picker     |nvim-tree-api.node.open.no_window_picker()|
--`p`               Paste                      |nvim-tree-api.fs.paste()|
--`P`               Parent Directory           |nvim-tree-api.node.navigate.parent()|
--`q`               Close                      |nvim-tree-api.tree.close()|
--`r`               Rename                     |nvim-tree-api.fs.rename()|
--`R`               Refresh                    |nvim-tree-api.tree.reload()|
--`s`               Run System                 |nvim-tree-api.node.run.system()|
--`S`               Search                     |nvim-tree-api.tree.search_node()|
--`u`               Rename: Full Path          |nvim-tree-api.fs.rename_full()|
--`U`               Toggle Filter: Hidden      |nvim-tree-api.tree.toggle_custom_filter()|
--`W`               Collapse                   |nvim-tree-api.tree.collapse_all()|
--`x`               Cut                        |nvim-tree-api.fs.cut()|
--`y`               Copy Name                  |nvim-tree-api.fs.copy.filename()|
--`Y`               Copy Relative Path         |nvim-tree-api.fs.copy.relative_path()|
--`<2-LeftMouse>`   Open                       |nvim-tree-api.node.open.edit()|
--`<2-RightMouse>`  CD                         |nvim-tree-api.tree.change_root_to_node()|