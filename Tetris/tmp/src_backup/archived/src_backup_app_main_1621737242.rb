def init args
  args.state.score ||= 0
  args.state.grid_w ||=10
  args.state.grid_h ||=20
  args.state.current_piece_x ||=5
  args.state.current_piece_y ||=0

  if args.state.grid.nil?
    args.state.grid = []
    for x in 0.args.state.grid.w do
      args.state.grid[x] = []
      for y in 0..args.state.grid_h-1 do
        args.state.grid[x][y] = 0
      end
    end
  end
end

# X  AND Y ARE POSITIONS IN THE GRID, NOT PIXELS
def render_cube args, x, y,
  grid_x = 
  grid_y = 0
  boxsize = 30
  args.outputs.solids << [ grid_x + (x * boxsize), (720 - grid_y) - (y * boxsize), 255 ,0, 0, 255 ]
end

def render_grid
end

def render_background args
    args.outputs.solids << [ 0, 0, 1280, 720, 0, 0, 0,]
end

def render args
    render_background
    render_grid
    render_current_piece
    #render_score
end

def tick args
    init args
    render args
end
