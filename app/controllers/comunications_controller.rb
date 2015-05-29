class ComunicationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comunication, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @comunications = Comunication.all
    respond_with(@comunications)
  end

  def show
    respond_with(@comunication)
  end

  def new
    @comunication = current_user.comunications.new
    respond_with(@comunication)
  end

  def edit
  end

  def create
    @comunication = current_user.comunications.new(comunication_params)
    @comunication.save
    ComunicationMailer.comunication_created(current_user,@comunication).deliver
    respond_with(:root)
  end

  def update
    @comunication.update(comunication_params)
    respond_with(@comunication)
  end

  def destroy
    @comunication.destroy
    respond_with(@comunication)
  end

  private
    def set_comunication
      #@comunication = current_user.comunications.find(params[:id])
      @comunication = Comunication.find(params[:id])
    end

    def comunication_params
      params.require(:comunication).permit(:title, :content, :user_id,:from)
    end
end
