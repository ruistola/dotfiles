-- opencode-buffer.nvim configuration. The plugin loads from a pack symlink; this
-- setup() opts into the external markdown renderer (~/projs/md-render), which
-- installs the buffer-local <leader>md / <leader>mD maps on session buffers.
-- md-render reads markdown from the path arg, so we point it at /dev/stdin.
require("opencode-buffer").setup({
	render = {
		cmd = { "md-render", "/dev/stdin" },
	},
})
