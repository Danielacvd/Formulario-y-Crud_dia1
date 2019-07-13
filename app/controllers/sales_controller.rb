class SalesController < ApplicationController

  def new

  end

  def create
    @sale = Sale.new(sales_params)
    @sale.total = @sale.value - (@sale.value * @sale.discount / 100)
    #asignar intener
    if @sale.tax != 1 #CheckBox seleccionado
      @sale.tax = 1.19
    end

    @sale.total = @sale.total * @sale.tax
  # @sale.save
    #redirect_to sales_done_path
    if @sale.save
      redirect_to sales_done_path
    else
      redirect_to sales_new_path 
    end
  end

  def done
    @sales = Sale.all
  end

  private
  def sales_params
    params.require(:sale).permit(:cod, :detail, :category, :value, :discount, :tax)
  end
end
