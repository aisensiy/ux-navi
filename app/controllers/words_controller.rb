class WordsController < ApplicationController
  def edit
    @word = Word.find(params[:id])
  end

  def update
  end

  def destroy
  end
end
