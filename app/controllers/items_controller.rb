class ItemsController < ApplicationController
  def index
    @users = User.page(params[:page]).per(5)
  end

  def new
  end

  def show
  end
end
