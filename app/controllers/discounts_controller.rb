class DiscountsController < ApplicationController
  def new
    @discount = Discount.new
  end

  def create
    @discount = Discount.new(discount_params)
    if @discount.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to new_discount_path, notice: "Successful submission" }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def discount_params
    params.require(:discount).permit(:title, :email, :expiration_date, :description, :image)
  end
end
