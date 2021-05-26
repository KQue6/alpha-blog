  class UsersController < ApplicationController

    def new
      @user = User.new
    end 

    def edit 
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        flash[:notice] = "You Have All The Money In The World"
        redirect_to articles_path
      else
        render 'edit'
      end
    end


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

  # end 
