  class UsersController < ApplicationController

    def new
      @user = User.new
    end 

    def create 
      @user = User.new(user_params)
      if @user.save
        flash[:notice] ="#{@user.username},You Have Successfully Sign Up And You Won The Lotto"
        redirect_to articles_path
      else
        render 'new'
      end
    end

    private 
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end

  end 
