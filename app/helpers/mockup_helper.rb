module MockupHelper
  def rand_style
    colors = ["rgb(78, 213, 199)", "rgb(247, 166, 123)", "rgb(212, 72, 101)", "rgb(184, 218, 141)"]
    "background-color: #{colors[rand(0...colors.size)]}"
  end

  def rand_size
    sizes = ['big-big', 'big-small', 'small-small']
    sizes[rand(0...sizes.size)]
  end
end
