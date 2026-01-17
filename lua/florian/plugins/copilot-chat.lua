local setup_copilot_chat, copilot_chat = pcall(require, "CopilotChat")
if not setup_copilot_chat then
    return
end

copilot_chat.setup({
    model = "gpt-5",
}
)

local keymap = vim.keymap
keymap.set("n", "<leader>cc", "<cmd>CopilotChat<CR>") -- Open Copilot Chat
keymap.set("v", "ze", "<cmd>CopilotChatExplain<CR>") -- Open Copilot Explanation
keymap.set("v", "zd", "<cmd>CopilotChatDocs<CR>") -- Open Copilot Explanation
keymap.set("v", "zr", "<cmd>CopilotChatReview<CR>") -- Open Copilot Explanation
keymap.set("v", "zo", "<cmd>CopilotChatOptimize<CR>") -- Open Copilot Explanation
