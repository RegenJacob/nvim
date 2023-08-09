return {
  {
    "connordeckers/tmux-navigator.nvim",
    cond = os.getenv("TMUX") ~= nil,
    config = true,
  }
}
