return {
  {
    "aserowy/tmux.nvim",
    cond = os.getenv("TMUX") ~= nil,
    config = true,
    enabled = false,
  }
}
