class NaviController < ApplicationController
  include NaviHelper
  layout 'application-fluid'

  def index
    @links = Link.includes(:tags, :categories)
    @tags = Tag.pluck(:name).uniq
    @categories = Category.pluck(:name).uniq
  end
end
