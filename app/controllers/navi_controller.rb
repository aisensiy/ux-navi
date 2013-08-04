class NaviController < ApplicationController
  include NaviHelper
  layout 'application-fluid'

  def index
    @links = Link.all
  end
end
