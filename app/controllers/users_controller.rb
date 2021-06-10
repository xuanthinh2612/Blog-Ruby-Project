class UsersController < ApplicationController

  def index
    #phan trang
    @users = User.all.paginate(page: params[:page], per_page: 3)
    # @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "wellcome to the blog"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'Update information successful'
      redirect_to articles_path
    else
      render 'edit'
    end
    # if
  end

  def show
    @user = User.find(params[:id])
    @user_articles = @user.articles.paginate(page: params[:page], per_page: 5)

  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end