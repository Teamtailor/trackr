require 'open-uri'
require 'json'

class Report
  ENDPOINT = Rails.env.production? ? "http://startuphack.herokuapp.com" : "http://localhost:3000"

  attr_accessor :domain

  def initialize(domain)
    self.domain = domain
  end

  def exist?
    history.map(&:last).any?(&:nonzero?)
  end

  def api
    JSON.parse(open(site_endpoint).read) rescue nil
  end

  # Stats
  # --------------------------------------------------------

  def online
    api['online_right_now']
  end

  def history
    api['history']
  end

  private
  def site_endpoint
    "#{ENDPOINT}/api/sites/#{domain}"
  end
end
