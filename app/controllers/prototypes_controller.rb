class PrototypesController < ApplicationController
  before_action :authenticate_user!, except:[:index, :show]
  before_action :check_user, only: :edit

  def index
    @prototype = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.create(prototype_params)
    if @prototype.valid?
      redirect_to root_path
    else# flash[:notice] = "新規作成が完了しました。"
      render :new
      #flash[:alert] = "登録には全ての情報を入力する必要があります"
    end
    #Prototype.create(prototype_params).valid?
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype.id)
    else
      render :edit
    end
    #@prototype = Prototype.find(params[:id])
    # if Prototype.update(prototype_params).valid?
    #   redirect_to prototype_path(@prototype.id)
    # else
    #   redirect_to edit_prototype_path(@prototype.id)
    #   #flash[:alert] = "登録には全ての情報を入力する必要があります"
    # end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comment.includes(:user)
  end
  
  def destroy
    @prototype = Prototype.find(params[:id])
    @prototype.destroy
    redirect_to root_path
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def check_user
    @prototype = Prototype.find(params[:id])
    unless current_user.id == @prototype.user.id
      redirect_to root_path
    end
  end
end
