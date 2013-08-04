# -*- encoding: utf-8 -*-

module NaviHelper
  def rand_style
    colors = ["rgb(78, 213, 199)", "rgb(247, 166, 123)", "rgb(212, 72, 101)", "rgb(184, 218, 141)"]
    "background-color: #{colors[rand(0...colors.size)]}"
  end

  def rand_size
    sizes = ['big-big', 'big-small', 'small-small']
    sizes[rand(0...sizes.size)]
  end

  def rand_tags
    tags = ['设计', '生活', 'Flat', '复古', '交互']
    rand_min = rand(0...tags.size)
    rand_max = [tags.size - 1, rand_min + rand(1..2)].min
    tags[rand_min..rand_max]
  end
end
