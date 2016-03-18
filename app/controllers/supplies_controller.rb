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
    @supply.date_due = StudentClass.find(supply_params[:student_class_id]).start_date
    @supply.update_attributes(supply_params)
    redirect_to @supply
  end

  def update
    authorize @supply
    @supply.update_attributes(supply_params)
    redirect_to @supply
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
