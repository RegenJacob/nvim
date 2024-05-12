return {
  {
    "lewis6991/gitsigns.nvim",
    -- cond = os.execute("sh -c git rev-parse --show-toplevel &> /dev/null") == 0, -- Isn't working
    config = function ()
      require('gitsigns').setup()
    end
  }
}
