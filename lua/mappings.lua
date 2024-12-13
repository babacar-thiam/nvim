require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Debugger mappings
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Add breakpoint at line" })
map("n", "<leader>dr", "<cmd> DapContinue <CR>", { desc = "Start or continue debugger" })
map("n", "<leader>dt", function()
    require("dapui").toggle()
end, { desc = "Toggle debugging UI" })
map("n", "<leader>do", "<cmd> DapStepOver <CR>", { desc = "Step Over" })
map("n", "<leader>di", "<cmd> DapStepInto <CR>", { desc = "Step Into" })
map("n", "<leader>dO", "<cmd> DapStepOut <CR>", { desc = "Step Out" })
map("n", "<leader>dx", "<cmd> DapTerminate <CR>", { desc = "Terminate Debug Session" })

-- For Go
map("n", "<leader>gd", function()
    require("dap-go").debug_test()
end, { desc = "Debug Go Test" })
