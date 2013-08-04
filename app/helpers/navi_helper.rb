# -*- encoding: utf-8 -*-

module NaviHelper
  def rand_style
    # colors = ["rgb(234, 87, 61)", "rgb(251, 192, 99)", "rgb(100, 176, 88)", "rgb(68, 102, 153)", "rgb(85, 85, 119)"]
    colors = ["#96D3CE", "#F58E88", "#FEC8A9", "#29AEFD"]
    "background-color: #{colors[rand(0...colors.size)]}"
  end

  def rand_size
    sizes = ['big-big', 'big-small', 'super-small', 'super-big', 'small-small']
    sizes[rand(0...sizes.size)]
  end

  def rand_tags
    tags = ['设计', '生活', 'Flat', '复古', '交互']
    rand_min = rand(0...tags.size)
    rand_max = [tags.size - 1, rand_min + rand(1..2)].min
    tags[rand_min..rand_max]
  end

  def navi_size(link)
    if link.title.size <= 6 and link.description.blank? and link.tags.size <= 2
      'small-small'
    elsif (link.title.size <= 6 and link.description.blank? and (3..6).include?(link.tags.size)) or (link.tags.size <= 2 and link.description.blank?)
      'big-small'
    else
      'big-big'
    end
  end
end
