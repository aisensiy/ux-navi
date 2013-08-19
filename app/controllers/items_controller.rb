class ItemsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :json

  def edit
    @item = Item.find_by_id(params[:id])
  end

  def update
    @item = Item.find_by_id(params[:id])
    @item.update_attributes(params[:item])
    redirect_to :back
  end

  def destroy
  end
end
