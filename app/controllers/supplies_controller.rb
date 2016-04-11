class SuppliesController < ApplicationController
  before_action :find_supply, only: [:show, :edit, :update, :destroy]

  def index
    @supplies = Supply.all
    authorize @supplies
  end

  def new
    @supply = Supply.new
    authorize @supply
  end

  def edit
    authorize @supply
  end

  def create
    @supply = Supply.new
    authorize @supply
    @supply.set_due_date(supply_params[:student_class_id])
    if @supply.update_attributes(supply_params)
      flash[:notice] = "New Supply Successfully Created"
      redirect_to @supply
    else
      render :new
    end
  end

  def update
    authorize @supply
    if @supply.update_attributes(supply_params)
      flash[:notice] = "Supply Successfully Updated"
      redirect_to @supply
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    authorize @supply
    @supply.delete
    redirect_to supplies_path
  end

  private

    def supply_params
      params.require(:supply).permit(:name, :amount, :student_class_id)
    end

    def find_supply
      @supply = Supply.find(params[:id])
    end
end
