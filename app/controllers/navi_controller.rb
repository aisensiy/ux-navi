class NaviController < ApplicationController
  include NaviHelper
  layout 'application-fluid'

  def index
    @links = Link.includes(:tags, :categories)
    @categories = Category.pluck(:name).uniq
    @top_words = Word.where('rank != ?', 0).order('rank')
  end

  def graph
    render json: Word.to_graph
  end
end

