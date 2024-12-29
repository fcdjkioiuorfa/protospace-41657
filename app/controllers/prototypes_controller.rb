class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_prototype_owner, only: [:edit, :update, :destroy]
  before_action :set_prototype, only: [:show, :edit, :update, :destroy]

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path, notice: 'プロトタイプが作成されました'
    else
      render 'new'
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user) 
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
      redirect_to @prototype, notice: 'プロトタイプが更新されました。'
    else
      render :edit, alert: 'プロトタイプの更新に失敗しました。'
    end
  end

  def destroy
    @prototype = Prototype.find(params[:id])
    if @prototype.destroy
      redirect_to prototypes_path, notice: 'プロトタイプが正常に削除されました。'
    else
      redirect_to prototype_path(@prototype), alert: 'プロトタイプの削除に失敗しました。'
    end
  end


  private

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def prototype_params
    params.require(:prototype).permit(:name, :Catchphrase, :catchphrase, :concept, :image).merge(user_id: current_user.id)
  end
end