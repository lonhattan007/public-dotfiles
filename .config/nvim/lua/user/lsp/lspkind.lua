-----------------------------------------------------------------------
-- NeoVim config module for LSPs' pictogram
-----------------------------------------------------------------------

local lsp_kind_status_ok, lspkind = pcall(require, "lspkind")
if not lsp_kind_status_ok then
    return
end

lspkind.init({
    mode = "symbol",
    preset = "codicons",
    --   פּ ﯟ   some other good icons
    symbol_map = {
        Text = "󰊄 ",
        Method = " ",
        Function = "󰊕 ",
        Constructor = " ",
        Field = " ",
        Variable = " ",
        Class = " ",
        Interface = " ",
        Module = " ",
        Property = " ",
        Unit = " ",
        Value = " ",
        Enum = " ",
        Keyword = " ",
        Snippet = "󰘍 ",
        Color = " ",
        File = "",
        Reference = " ",
        Folder = " ",
        EnumMember = " ",
        Constant = " ",
        Struct = " ",
        Event = " ",
        Operator = "󰘧 ",
        TypeParameter = " ",
    },
})
