require 'open-uri'

class Report
  ENDPOINT = Rails.env.production? ? "http://startuphack.herokuapp.com" : "http://localhost:3000"

  attr_accessor :domain

  def initialize(domain)
    self.domain = domain
  end

  def exist?
    api || false
  end

  def api
    @api ||= open(site_endpoint) rescue false
  end

  private
  def site_endpoint
    ENDPOINT << "/api/sites/#{self.domain}"
  end
end
