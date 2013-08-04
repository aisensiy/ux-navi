class NaviController < ApplicationController
  include NaviHelper
  layout 'application-fluid'

  def index
    @links = Link.includes(:tags)
    @tags = Tag.pluck(:name).uniq
  end
end
