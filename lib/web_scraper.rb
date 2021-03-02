require 'nokogiri'
require 'httparty'
require 'byebug'

class Crawler
  def initialize
    @url = 'https://www.myjobmag.com/search/jobs?q=software+engineer'
    unparsed_page = HTTParty.get(@url)
    @parsed_page = Nokogiri::HTML(unparsed_page)
  end

  def take_title
    @parsed_page.css('li.job-list-li').map(&:text)
  end

  def take_link
    @parsed_page.css('li.job-list-li.a').map{ |link| 'https://www.myjobmag.com' + link['href'] }
  end

  def take_description
    @parsed_page.css('li.job-desc').map(&:text)
  end

end
