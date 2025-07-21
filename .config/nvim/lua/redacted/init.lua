require("redacted.remap")
require("redacted.lazy")
vim.opt.runtimepath:append("~/.local/bin/")

vim.diagnostic.config({
    virtual_text = true, -- Show inline messages
    -- Other options for appearance, like prefix and spacing
    virtual_text = {
        prefix = "●",
        spacing = 2,
    },
})


