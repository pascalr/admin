class SpendingsController < ApplicationController
  def monthly
    if params[:month].blank?
      redirect_to spendings_monthly_path(month: Date.current.month)
    else
      d = Date.new(Date.current.year,params[:month].to_i,15)
      @purchases = Purchase.where(day: d.beginning_of_month..d.end_of_month).order(:day)
      @spendings = Spending.where(day: d.beginning_of_month..d.end_of_month).order(:day)
    end
  end
end
