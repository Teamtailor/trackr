require 'report'

class ReportsController < ApplicationController
  def show
    @report = Report.new(params[:id])
    if @report.exist?
      render text: "Alright!"
    else
      render text: "No report :("
    end
  end

  def create
    redirect_to report_path(params[:domain])
  end
end
