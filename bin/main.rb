require_relative '../lib/web_scraper'
require_relative '../lib/whole_web'

class Display
  def front_page
    crawler = Crawler.new
    job = crawler.title
    company = crawler.company
    link = crawler.link
  end

  job.each_with_index do |_item, index|
    puts "==============================================\n"
    puts "job: #{job[index]}"
    puts "company:  #{company[index]}"
    puts "link:  #{link[index]}\n\n"
  end