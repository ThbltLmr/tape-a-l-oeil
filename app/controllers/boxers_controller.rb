class BoxersController < ApplicationController
  def index
    @boxers = Boxer.all
  end

  def new
    @boxer = Boxer.new
  end

  def create
    @boxer = Boxer.new(boxers_params)
    @boxer.user = User.find(params[:id])
    @boxer.save
    if @boxer.save
      redirect_to boxer_path(@boxer)
    else
      render :new, status: :unprocessable_entity
    end
  end
end
