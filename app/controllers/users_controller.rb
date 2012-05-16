class UsersController < ApplicationController
  before_filter :current_user
  
  def show
    if @current_user.nil?
      redirect_to :action => :index
    end
    @user = User.find(params[:id])
  end
  
  def index
    @users = User.all
  end
end
