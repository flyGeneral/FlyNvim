local cmp = require("cmp")
local lspkind = require("lspkind")

-- 自动提示3 详情信息
local cmpFormat3 = function(entry, vim_item)
  -- fancy icons and a name of kind
  vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. ""
  -- set a name for each source
  vim_item.menu =
    ({
    buffer = "[Buffer]",
    nvim_lsp = "",
    ultisnips = "[UltiSnips]",
    nvim_lua = "[Lua]",
    cmp_tabnine = "[TabNine]",
    look = "[Look]",
    path = "[Path]",
    spell = "[Spell]",
    calc = "[Calc]",
    emoji = "[Emoji]"
  })[entry.source.name]
  return vim_item
end

cmp.setup({
    -- 设置代码片段引擎，用于根据代码片段补全
    snippet = {
        expand = function(args)
        require("luasnip").lsp_expand(args.body)
        end
    },

    window = {
    },

    mapping = {
        -- 选择上一个
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        -- 选择下一个
        ['<C-n>'] = cmp.mapping.select_next_item(),
        -- 出现补全
        ['<A-.>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
        -- 取消补全
        ['<A-,>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),

        -- 确认使用某个补全项
        ['<CR>'] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace
        }),

        -- 向上翻页
        ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
        -- 向下翻页
        ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),
    },

    -- 补全来源
    sources = cmp.config.sources({
        {name = 'nvim_lsp'},
        {name = 'vsnip'},
        {name = 'buffer'},
        {name = 'path'}
    }),

    --根据文件类型来选择补全来源
    cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
            {name = 'buffer'}
        })
    }),

    -- 命令模式下输入 `/` 启用补全
    cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = 'buffer' }
        }
    }),

    -- 命令模式下输入 `:` 启用补全
    cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = 'path' }
        }, {
                { name = 'cmdline' }
            })
    }),

    -- 设置补全显示的格式
    formatting = {
        format = cmpFormat3,
    },
})
