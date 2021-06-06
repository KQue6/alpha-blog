  class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update]
    before_action :require_user, only: [:edit, :update]
    before_action :require_same_user, only: [:edit, :update]

    def show 
      @articles = @user.articles.paginate(page: params[:page], per_page: 6)
    end
      
      def index 
        @users = User.paginate(page: params[:page], per_page: 5)
      end


    def new
      @user = User.new
    end 

    def edit 
    end

    def update
      if @user.update(user_params)
        flash[:notice] = "You Have All The Money In The World"
        redirect_to @user
      else
        render 'edit'
      end
    end


    # end

    def create 
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
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
    def set_user
      @user = User.find(params[:id])
    end

    def require_same_user
      if current_user != @user
        flash[:alert] = "Q-writers Editing Rights Are For Personal Books And Pages"
        redirect_to @user
      end
    end

  end
