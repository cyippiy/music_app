class BandsController < ApplicationController

  def index
    @bands = Band.all
    render :index
  end

  def new
    @bands = Band.new
    render :new
  end

  def create
    @bands = Band.new(params[:name])
    if @bands.save!
      redirect_to band_url
    else
      flash.now[:errors] = @bands.errors.fullmessages
      render :new
    end
  end

  def edit
    @bands = Band.find_by(params[:name])
    render :edit
  end

  def show
    @bands = Band.find_by(params[:name])
    render :show
  end

  def update

  end

  def destroy

  end
end
