class NaviController < ApplicationController
  include NaviHelper
  layout 'application-fluid'

  def index
    @links = Link.includes(:tags, :categories)
    @tags = Link.tag_counts.order('count desc').select { |elem| elem.count.to_i > 1 }
    @categories = Category.pluck(:name).uniq
  end
end
