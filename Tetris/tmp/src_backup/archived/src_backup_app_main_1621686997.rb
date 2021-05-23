def init args
    args.state.score ||= 0
    args.state.grid_w ||=10
    args.state.grid_h ||=20
    args.state.current_piece_x
end

def tick args
  init args
  args.outputs.solids << [0, 0, 1280, 720, 0, 0, 0]

end
