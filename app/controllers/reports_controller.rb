require 'report'

class ReportsController < ApplicationController
  def show
    @report = Report.new(params[:id])
    return render(nothing: true, status: 404) unless @report.exist?
  end

  def history
    @report = Report.new(params[:report_id])
    render json: @report.history.select{ |h| h.first > params[:since].to_i }
  end

  def create
    redirect_to report_path(params[:domain])
  end
end
