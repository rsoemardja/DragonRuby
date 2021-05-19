$gtk.represent
def tick args
    if !args.state.click_count
        args.state.click_count = 0
    end
    args.state.click_count2 = 0 if !args.state.click_count2
    args.state.click_count3 ||= 0
    
    if args.inputs.mouse.up
        args.state.click_count += 1

        args.inputs.mouse.up = 0
    end

    if args.state.click_count == 1
        args.outputs.labels << [80, 40,
        "A New Text", -5, 0, 200, 50, 200, 255]
      elsif args.state.click_count == 2
        args.outputs.labels << [20, 80,
        "Look a New Text", -5, 1, 70, 50, 250, 165]
      elsif args.state.click_count == 3
        args.outputs.labels << [120, 40,
        "Another New Text", -5, 1, 0, 250, 200, 255]
      elsif args.state.click_count == 4
        args.outputs.labels << [100, 20,
        "Text That's New", -5, 1, 200, 50, 0, 55]
      elsif args.state.click_count > 4
        args.outputs.labels << [80, 60,
        "This is very important", -5, 1, 00, 20, 00, 255]
        args.outputs.labels << [80, 40,
        "for creating a user interface",
        -5, 1, 0, 50, 0, 255]
        args.outputs.labels << [80, 20,
        "^_^", -5, 1, 20, 20, 20, 255]
      else
        args.outputs.labels << [80, 40,
        " Click now", -5, 1, 0, 0, 0, 255]
        args.outputs.labels << [80, 20,
        "^_^", -5, 1, 200, 250, 200, 255]
      end
    end
    # What it will do is that with 5 mouse clicks
    # It will output text with each click