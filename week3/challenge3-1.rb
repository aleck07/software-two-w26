def init()
  widget_width = screen_width()
  board_width = calculate_border(widget_width)
end

def calcualte_border(width)
  border_width = 2
  board_width = width - border_width # -2 for border
end

def on_resize(width)
  board_width = calculate_border(width)
end