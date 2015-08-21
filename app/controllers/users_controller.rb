class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  # GET /articles
  # GET /articles.json
  def index
    @users = User.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @articles = User.find(params[:id]).articles.where("view = true").order("created_at DESC").page params[:page]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :avatar, :avatar_cache, :remove_avatar)
    end
end
