require 'nokogiri'
require 'httparty'
require_relative '../lib/web_scraper'
require_relative '../lib/whole_web'

describe Crawler do
  @url = 'https://www.myjobmag.com/search/jobs?q=software+engineer'
  unparsed_page = HTTParty.get(@url)
  @parsed_page = Nokogiri::HTML(unparsed_page.body)
  page = Crawler.new

  describe '#take_title' do
    it 'returns the title of the listing on the first page' do
      title_example = page.take_title
      expect(page.send(:take_title)).to eq(title_example)
    end
    it 'does not return a value that is not a title' do
      non_title = 'Customer Care Agent'
      expect(page.send(:take_title)).not_to include(non_title)
    end
  end

  describe '#take_description' do
    it 'returns the description of the listing on the first page' do
      description_example = page.take_description
      expect(page.send(:take_description)).to eq(description_example)
    end
    it 'does not return the description of the listing on the first page' do
      none_description = 'Office assistant '
      expect(page.send(:take_description)).not_to include(none_description)
    end
  end
end

describe Web do
  @url = 'https://www.myjobmag.com/search/jobs?q=software+engineer&currentpage=21'
  unparsed_page = HTTParty.get(@url)
  @parsed_page = Nokogiri::HTML(unparsed_page.body)
  page_whole = Web.new

  describe '#all_title' do
    it 'returns the title of the listing on the rest of the website' do
      title_example = page_whole.all_title
      expect(page_whole.send(:all_title)).to eq(title_example)
    end
    it 'does not return a value that is not a title' do
      non_title = 'Customer Care Agent'
      expect(page_whole.send(:all_title)).not_to include(non_title)
    end
  end

  describe '#all_description' do
    it 'returns the description of the listing on the rest of the site' do
      description_example = page_whole.all_description
      expect(page_whole.send(:all_description)).to eq(description_example)
    end
    it 'does not returns the description of the listing on the rest of the site' do
      none_description = 'Office assistant'
      expect(page_whole.send(:all_description)).not_to include(none_description)
    end
  end
end
