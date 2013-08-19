class ItemsController < ApplicationController
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
