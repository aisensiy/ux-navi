class WordsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :json

  def index
    @words = Word.all
  end

  def edit
    @word = Word.find_by_id(params[:id])
  end

  def update
    @word = Word.find_by_id(params[:id])
    @word.update_attributes(params[:word])
    redirect_to :back
  end

  def destroy
  end
end
