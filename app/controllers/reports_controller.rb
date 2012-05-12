require 'report'

class ReportsController < ApplicationController
  def show
    @report = Report.new(params[:id])
    return render(status: 404) unless @report.exist?
  end

  def create
    redirect_to report_path(params[:domain])
  end
end
