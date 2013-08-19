class NaviController < ApplicationController
  include NaviHelper

  def index
    @links = Item.all
    @categories = Category.pluck(:name).uniq
    @top_words = Word.where('rank != ?', 0).order('rank')
  end

  def graph
    render json: Word.to_graph
  end
end

