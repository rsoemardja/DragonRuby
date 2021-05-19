def tick args
    # board x axis
    board_x = 50
    # board y axis
    board_y = 60
    # board width
    board_w = 20
    # board height
    board_h = 20

    #                       X         Y
    args.outputs.borders << [board_x, board_y
    #       WIDTH   HEIGHT  RED GREEN   BLUE    ALPHA
            board_w, board_h, 0, 0,     200, 255]

    args.outputs.solids << [board_x+1, board_y+1,
    board_w-2, board_h-2, 35, 0, 50, 255]

end