class ItemsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :json

  def new
    @item = Item.new
  end

  def create
    @item = Item.new params[:item]
    @item.save!
    flash[:notice] = 'Item was successfully created.'
    redirect_to edit_item_path(@item)
  end

  def edit
    @item = Item.find_by_id(params[:id])
  end

  def update
    @item = Item.find_by_id(params[:id])
    @item.update_attributes(params[:item])
    flash[:notice] = 'Item was successfully updated.'
    redirect_to :back
  end

  def destroy
  end
end
