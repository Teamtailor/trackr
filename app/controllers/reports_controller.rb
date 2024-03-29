require 'report'

class ReportsController < ApplicationController
  def show
    @report = Report.new(params[:id])
    return render(action: 'install') unless @report.exist?
  end

  def history
    @report = Report.new(params[:report_id])
    render json: [@report.history.select{ |h| h.first > params[:since].to_i }.first]
  end

  def create
    redirect_to report_path(params[:domain])
  end
end
