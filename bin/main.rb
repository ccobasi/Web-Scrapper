require_relative '../lib/web_scraper'
require_relative '../lib/whole_web'

class Display
  def front_page
    crawler = Crawler.new
    job = crawler.take_title
    company = crawler.take_description
    link = crawler.take_link
  end

  job.each_with_index do |_item, index|
    puts "==============================================\n"
    puts "job: #{job[index]}"
    puts "description:  #{description[index]}"
    puts "link:  #{link[index]}\n\n"
  end