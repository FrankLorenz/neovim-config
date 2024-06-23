return {
    'vimwiki/vimwiki',
    init = function ()
        vim.g.vimwiki_list = {
            {
                path = '$CLOUDDRIVEPATH/Wiki/vimwiki/FL Wiki',
                syntax = 'default',
                ext = '.wiki',
            }
        }
    end,
    keys = {
      { "<leader>vw", "<plug>VimwikiIndex", desc = "Open VimWiki index" },
    },
}
