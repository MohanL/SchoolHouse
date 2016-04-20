class SuppliesController < ApplicationController
  before_action :find_supply, only: [:show, :edit, :update, :destroy]

  def index
    @supplies = Supply.all
    @supply = Supply.new
    authorize @supplies
  end

  def new
    @supply = Supply.new
    authorize @supply
    respond_to do |format|
      format.html { render :new }
      format.js {}
    end
  end

  def edit
    authorize @supply
    respond_to do |format|
      format.html { render :edit }
      format.js {}
    end
  end

  def create
    @supply = Supply.new
    authorize @supply
    @supply.set_due_date(supply_params[:student_class_id])
    respond_to do |format|
      if @supply.update_attributes(supply_params)
        format.html { redirect_to @supply, notice: "New Supply Successfully Created" }
        format.js {}
      else
        format.html { render :new }
      end
    end
  end

  def update
    authorize @supply
    respond_to do |format| 
      if @supply.update_attributes(supply_params)
        format.html { redirect_to @supply, :notice => "Supply Successfully Updated" }
        format.js {}
      else
        render :edit
      end
    end
  end

  def show
  end

  def destroy
    authorize @supply
    @id = @supply.delete.id
    respond_to do |format|
     format.html { redirect_to supplies_path }
     format.js {}
    end
  end

  private

    def supply_params
      params.require(:supply).permit(:name, :amount, :student_class_id)
    end

    def find_supply
      @supply = Supply.find(params[:id])
    end
end
