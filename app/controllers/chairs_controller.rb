class ChairsController < ApplicationController
  before_action :set_chair, only:[:show, :edit, :update]

  def index
    @chairs = Chair.all
  end

  def show
  end

  def new
    @chair = Chair.new
  end

  def create
    chair = Chair.new(chair_params)
    if chair.save
      flash[:notice] = "You successfully saved a chair!"
      redirect_to chair_path(chair)
    else
      @chair = chair
      render :new
    end
  end

  def edit
  end

  def update
    if @chair.update(chair_params)
      flash[:notice] = "You successfully updated a chair!"
      redirect_to chair_path(@chair)
    else
      render :edit
    end
  end

  def destroy
    chair = Chair.find(params[:id])
    chair.destroy
    flash[:notice] = "You successfully deleted a chair"
  end

  private

  def chair_params
    params.require(:chair).permit(:name, :age)
  end

  def set_chair
    @chair = Chair.find(params[:id])
  end

end
