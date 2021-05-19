$gtk.reset
def tick args
    if !args.state.sprite_x

        args.state.sprite_x = 100
        args.state.sprite_y = 80

        args.state.sprite_size = 5

        arg.state.sprite_movement_speed = 1
    end
    args.outputs.sprites << [args.state.sprite_x,
    args.state.sprite_y, args.state.sprite_size,
    args.state.sprite_size, 'sprites/circle-black.png']

    args.state.sprite_x += args.state.sprite_movement_speed if args.inputs.keyboard.d
    args.state.sprite_x -= args.state.sprite_movement_speed if args.inputs.keyboard.a
    args.state.sprite_y += args.state.sprite_movement_speed if args.inputs.keyboard.w
    args.state.sprite_y -= args.state.sprite_movement_speed if args.inputs.keyboard.s
  end