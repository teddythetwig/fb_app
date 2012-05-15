class UsersController < ApplicationController
  before_filter :current_user
  
  def show
    if @user.nil?
      redirect_to :action => :index
    end
  end
  
  def index
    @users = User.all
  end
end
