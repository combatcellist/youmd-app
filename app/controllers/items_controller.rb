class ItemsController < ApplicationController

  before_action :find_item, only: [:show, :update, :edit, :destroy]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def show
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new   
    end
  end

  def update
    if @item.update(item_params)
      redirect_to root_path, notice: "メニューが更新されました"
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path, notice: "メニューが削除されました"
    else
      redirect_to root_path, notice: "メニューを削除できませんでした"
    end
  end

  private

  def item_params
   params.require(:item).permit(:name, :price, :content).merge(user_id: current_user.id)
  end

  def find_item
    @item = Item.find(params[:id])
  end
end
