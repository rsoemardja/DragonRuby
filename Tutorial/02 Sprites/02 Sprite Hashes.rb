def tick args

    args.outputs.sprites << {
        x: 80,
        y: 40,
        w: 10,
        h: 10,
        #if you don't change the path of the sprite it set to a default sprite
        path: "sprites/circle.png",
        angle: 0,
        a: 255,
        r: 255,
        g: 255,
        b: 255,
        # Apparently there won't be touching this tutorial,
        # but ill note that it is useful
        source_x: 0,
        source_y: 0,
        source_w: -1,
        source_h: -1,
        flip_vertically: false,
        flip_horizontally: false,
        angle_anchor_x: 0.5,
        angle_anchor_y: 1.0
    }
end