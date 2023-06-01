class BoxersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @boxers = Boxer.all
    if params[:address].present?
      @boxers = @boxers.select { |boxer| boxer.distance_from(params[:address]) < boxer.availability_radius }
    end
    session[:address] = params[:address]
  end

  def new
    @boxer = Boxer.new
  end

  def create
    @boxer = Boxer.new(boxer_params)
    @boxer.user = current_user
    if @boxer.save
      redirect_to boxer_path(@boxer), alert: "Boxer created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @boxer = Boxer.find(params[:id])
  end

  private

  def boxer_params
    params.require(:boxer).permit(:first_name, :last_name, :age, :weight, :height, :address, :price_per_day, :gender, :availability_radius, :photo)
  end
end
