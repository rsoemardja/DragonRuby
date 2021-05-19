def tick args
    #                       X1     Y1      X2
    args.outputs.lines << [0,      90,     160,
    # Y2    RED     GREEN   BLUE    ALPHA
      0,    0,      0,      0,      255]

    # The Line also has a hash values
      arg.outputs.lines << {
          x: 0,
          y: 0,
          x2: 160,
          y2: 90,
          r: 0,
          g: 255,
          b: 50,
          a: 255
      }
      # if you play around with values the colors of the lines will change