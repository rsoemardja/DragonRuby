$gtk.reset
# be sure to save frame to frame
def tick args
    args.state.sprite_x ||= 10
    args.state.sprite_y ||= 10
    args.state.sprite_size ||= 5

    args.outputs.sprites << [args.state.sprite_x,
    args.state.sprite_y, args.state.sprite_size,
    args.state.sprite_size, 'sprites/circle-black.png']

    args.state.sprite_x = (args.state.sprite_x + 
        args.state.tick_count/4000)%160 if args.state.sprite_x
    args.state.sprite_y = (args.state.sprite_y + args.state
    .tick_count/4000)%90 if args.state.sprite_y

    args.outputs.labels << [50, 50, args.state.tick_count]

end