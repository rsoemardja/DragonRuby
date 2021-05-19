def tick args
    #                       X   Y   TEXT
    args.outputs.labels << [70, 70, "This is text",
    # SIZE, ALIGNMENT,  RED,    GREEN,      BLUE,        ALPHA
    -5,         0,      0,      0,          100,     175
    # FONT FILE IT has to USE TTF
     "fonts/coolfont.ttf"]

     # I will represent text with a hash function
     # instead of an array.
     args.outputs.labels << {
         x: 10,
         y: 20,
         text: "hash",
         size_enum: -5,
         alignment_enum: 0,
         r: 155,
         g: 50,
         b: 50,
         a: 50,
         font: "fonts/manaspc.ttf"
     }
end