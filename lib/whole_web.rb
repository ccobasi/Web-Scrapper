require 'nokogiri'
require 'httparty'
require 'byebug'

class Web
  def initialize
    page_number = 22
    while page_number <= 40
      @ur_first = 'https://www.myjobmag.com/search/jobs?q=software+engineer'
      @ur_last = '&currentpage=21'
      @ur = "#{@ur_first}#{page_number}#{@ur_last}"
      unparsed_page = HTTParty.get(@ur)
      @parsed_page = Nokogiri::HTML(unparsed_page.body)
      page_number += 22
    end
  end

  def all_title
    @parsed_page.css('li.job-list-li').map(&:text)
  end

  def all_description
    @parsed_page.css('li.job-desc').map(&:text)
  end
end
