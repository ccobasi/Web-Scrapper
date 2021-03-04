require 'nokogiri'
require 'httparty'
require_relative '../lib/web_scraper'
require_relative '../lib/whole_web'

describe Crawler do
  @url = 'https://www.myjobmag.com/search/jobs?q=software+engineer'
  unparsed_page = HTTParty.get(@url)
  @parsed_page = Nokogiri::HTML(unparsed_page)
  page = Crawler.new

  describe '#take_title' do
    it 'returns the title of the listing on the first page' do
      title_example = 'Software Engineer'
      expect(page.send(:take_title)).to include(title_example)
    end
    it 'does not return a value that is not a title' do
      title_example = 'Software Engineer'
      expect(page.send(:take_title)).not_to include(title_example)
    end
  end

  describe '#take_description' do
    it 'returns the description of the listing on the first page' do
      description_example = 'Engineer Engineering developer '
      expect(page.send(:take_description)).to include(description_example)
    end
    it 'does not return the description of the listing on the first page' do
      description_example = 'Engineer Engineering developer '
      expect(page.send(:take_description)).not_to include(description_example)
    end
  end
end

describe Web do
  @url = 'https://www.myjobmag.com/search/jobs?q=software+engineer&currentpage=21'
  unparsed_page = HTTParty.get(@url)
  @parsed_page = Nokogiri::HTML(unparsed_page)
  page_whole = Web.new

  describe '#all_title' do
    it 'returns the title of the listing on the rest of the website' do
      title_example = 'Software Engineer'
      expect(page_whole.send(:all_title)).to include(title_example)
    end
    it 'does not return a value that is not a title' do
      title_example = 'Software Engineer'
      expect(page_whole.send(:all_title)).not_to include(title_example)
    end
  end

  describe '#all_description' do
    it 'returns the description of the listing on the rest of the site' do
      description_example = 'Engineer Engineering developer'
      expect(page.send(:take_description)).to include(description_example)
    end
  end
end
