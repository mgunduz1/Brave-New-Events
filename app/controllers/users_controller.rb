class UsersController < ApplicationController
  include Filterable
  before_action :authenticate_user!, except: :index

  def profile
    @user = User.find(params[:id])
    
  end

  def index
    @users = User.all
    @users = filter_for("User").apply!(@users)
  end
end
