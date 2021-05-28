$gtk.reset

class TetrisGame
  def initialize args
    @args = args
    @score = 0
    @gameover = false
    @grid_w = 10
    @grid_h = 20
    @current_piece_x = 5
    @current_piece_y = 0
    @grid
    for x in 0..@grid_w-1 do
      @grid[x] = []
      for y in 0..@grid_h-1 do
        @grid[x][y] = 0
      end
    end
  end
  
#   def init args
#     args.state.score ||= 0
#     args.state.grid_w ||=10
#     args.state.grid_h ||=20
#     args.state.current_piece_x ||=5
#     args.state.current_piece_y ||=0

#     if args.state.grid.nil?
#       args.state.grid = []
#       for x in 0.args.state.grid.w do
#       args.state.grid[x] = []
#       for y in 0..args.state.grid_h-1 do
#         args.state.grid[x][y] = 0
#       end
#     end
#   end
# end

  # X  AND Y ARE POSITIONS IN THE GRID, NOT PIXELS
  def render_cube x, y
    boxsize = 30
    grid_x = (1280 - (args.state.grid_w * boxsize)) / 2
    grid_y = (720 - (args.state.grid_h * boxsize)) / 2
    args.outputs.solids << [ grid_x + (x * boxsize), (720 - grid_y) - (y * boxsize), 255 ,0, 0, 255 ]
  end

  def render_grid args
    for x in 0..args.state.grid_w-1 do
      for y in 0..args.state.grid_h-1 do
        render_cube args, x, y
      end
    end
  end

  def render_background args
    args.outputs.solids << [ 0, 0, 1280, 720, 0, 0, 0,]
  end

  def render_current_piece
    for x in 0..@current_piece.length-1 do
      for y in 0..@current_piece[x].length-1 do
        render_cube @current_piece_x + x, @current_piece_y, 255, 0, 0 if @current_piece[x][y] != 0
      end
    end
  end

  def render args
    render_background
    render_grid
    render_current_piece
    #render_score
  end

  def tick
    @grid[2][2] = 1
    @grid[7][15] = 1
    render
  end

  def current_piece_colliding
    for x in 0..@current_piece.length-1 do
      for  y in 0..@current_piece[x].length-1 do
        if (@current_piece[x][y] != 0)
          if (@current_piece_y + y >= @grid_h-1)
            return true
          elsif (@grid[@current_piece_x + x][@current_piece_y + y] != 0)
            return true
          end
        end
      end
    end
    return false
  end

  def plant_current_piece
    # Make this part of the landscape
    for x in 0..@current_piece.length-1 do
      for y in 0.@current_piece[x].length-1 do
        if @current_piece[x][y] != 0
          @grid[@current_piece_x + x][@current_piece_y + y] = @current_piece[x][y]
        end
      end
    end
    @current_piece_y = 0
  end

end

def tick args
    args.state.game ||= TetrisGame.new args
    args.state.game.tick
end
