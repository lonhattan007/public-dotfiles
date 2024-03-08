-----------------------------------------------------------------------
-- NeoVim config module for LSP file operations
-----------------------------------------------------------------------

local lsp_file_ops_status_ok, lsp_file_ops = pcall(require, "lsp-file-operations")
if not lsp_file_ops_status_ok then
	return
end

lsp_file_ops.setup()
