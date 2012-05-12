require 'open-uri'

class Report
  ENDPOINT = Rails.env.production? ? "http://startuphack.herokuapp.com" : "http://localhost:3000"

  attr_accessor :id

  def initialize(id)
    self.id = id
  end

  def exist?
    api || false
  end

  def api
    @api ||= open(site_endpoint) rescue false
  end

  private
  def site_endpoint
    ENDPOINT << "/api/sites/#{self.id}"
  end
end
