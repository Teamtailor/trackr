require 'open-uri'
require 'json'

class Report
  ENDPOINT = Rails.env.production? ? "http://startuphack.herokuapp.com" : "http://localhost:3000"

  attr_accessor :domain

  def initialize(domain)
    self.domain = domain
  end

  def exist?
    api && history.map(&:last).any?(&:nonzero?)
  end

  def api
    @api ||= JSON.parse(open(site_endpoint).read) rescue nil
  end

  # Stats
  # --------------------------------------------------------

  def online
    api['online_right_now']
  end

  def history
    api['history'].map{ |item| [item.first.to_i, item.last] }
  end

  def top_urls
    api['top_urls'][0,5].map{ |item| [item.first[0, 50], item.last]  }
  end

  private
  def site_endpoint
    "#{ENDPOINT}/api/sites/#{domain}"
  end
end
