def tick args
  args.outputs.labels  << [640, 500, 'Hello Everyone!', 5, 1]
  args.outputs.labels  << [640, 460, 'Go to docs/docs.html and read it!', 5, 1]
  args.outputs.sprites << [576, 280, 128, 101, 'dragonruby.png']
end
