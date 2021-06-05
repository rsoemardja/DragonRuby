$gtk.reset

class TetrisGame
  def initialize args
    @args = args
    @next_move = 30
    @score = 0
    @gameover = false
    @grid_w = 10
    @grid_h = 20
    @grid = []
    for x in 0..@grid_w-1 do
      @grid[x] = []
      for y in 0..@grid_h-1 do
        @grid[x][y] = 0
      end
    end

    @color_index = [
    [ 0, 0, 0],
    [ 255, 0, 0],
    [ 0, 255, 0],
    [ 0, 0, 255],
    [ 255, 255, 0],
    [ 255, 0, 255],
    [ 0, 255, 255],
    [ 127, 127, 127]
    ]
  
    select_next_piece
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
  def render_cube x, y, color
    boxsize = 30
    grid_x = (1280 - (@grid_w * boxsize)) / 2
    grid_y = (720 - ((@grid_h-2) * boxsize)) / 2
    args.outputs.solids << [ grid_x + (x * boxsize), (720 - grid_y) - (y * boxsize),  boxsize, boxsize, *@color_index[color] ]
    args.outputs.borders << [ grid_x + (x * boxsize), (720 - grid_y) - (y * boxsize),  boxsize, boxsize, 255,255,255 ]
  end

  def render_grid
    for x in 0..args.state.grid_w-1 do
      for y in 0..args.state.grid_h-1 do
        render_cube x, y, @grid[x][y] if @grid[x][y] != 0
      end
    end
  end

  def render_grid_border
    x = -1
    y = -1
    w = @grid_w + 2
    h = @grid_h + 2
    color = 7
    for i in x..(x+w)-1 do
      render_cube i, y, color
      render_cube i, (y+h)-1, color
    end
    for i in y..(y+h)-1 do
      render_cube x, i, color
      render_cube (x+w)-1, i, color
    end
  end

  def render_background
    @args.outputs.solids << [ 0, 0, 1280, 720, 0, 0, 0,]
    render_grid_border
  end

  def render_current_piece
    for x in 0..@current_piece.length-1 do
      for y in 0..@current_piece[x].length-1 do
        render_cube @current_piece_x + x, @current_piece_y, @current_piece[x][y] if @current_piece[x][y] != 0
      end
    end
  end

  def render args
    render_background
    render_grid
    render_current_piece
    #render_score
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

  def select_next_piece
    X = rand(6) + 1
    @current_piece = case X
      when 1 then [ [ X, X], [ 0, X ], [ 0, X] ]
      when 2 then [ [ X, X,  X, X ] ]
      when 3 then [ [ X, 0], [ X, X ], [ 0, X] ]
      when 4 then [ [ 0, X], [ X, X ], [ X, 0] ]
      when 5 then [ [ X, X], [ X, X ] ]
      when 6 then [ [ 0, X], [ X, X ], [ 0, X] ]
      when 7 then [ [ 0, X], [ 0, X ], [ X, X] ]
    end
  end

  def plant_current_piece
    # Make this part of the landscape
    for x in 0..@current_piece.length-1 do
      for y in 0..@current_piece[x].length-1 do
        if @current_piece[x][y] != 0
          @grid[@current_piece_x + x][@current_piece_y + y] = @current_piece[x][y]
        end
      end
    end
    @current_piece_y = 0
    @current_piece_x = 5
    select_next_piece
  end

  def rotate_current_piece_left
    @current_piece = @current_piece.transpose.map(&:reverse)
    if (@current_piece_x + @current_piece.length) >= @grid_w
        @current_piece_x = @grid_w - @current_piece.length
    end
  end

  def rotate_current_piece_right
    @current_piece = @current_piece.transpose.map(&:reverse)
    @current_piece = @current_piece.transpose.map(&:reverse)
    @current_piece = @current_piece.transpose.map(&:reverse)
  end

  def iterate
    #check input!
    k = @args.input.keyboard
    c = @args.input.controller_one

    if k.key_down.left || c.key_down.left
      if @current_piece_x > 0
        @current_piece_x -= 1
      end
    end
    
    if k.key_down.right || c.key_down.right
      if (@current_piece_x + @current_piece.length) < (@grid_w)
        @current_piece_x += 1
      end
    end
    
    if k.key_down.down || k.key_held.down || c.key_down.down || c.key_held.down
      @next_move -= 10
    end

    if k.key_down.a || c.key_down.a
      rotate_current_piece_left
    end

    if k.key_down.s || c.key_down.b
      rotate_current_piece_right
    end

    @next_move -= 1
    if @next_move <= 0 # drop the piece!
      if current_piece_colliding
        plant_current_piece
      else
         @current_piece_y += 1
      end
      @next_move = 30
    end
  end

  def tick
      iterate
      render
  end
end

def tick args
    args.state.game || TetrisGame.new args
    args.state.game.tick
end
