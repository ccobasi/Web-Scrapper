require_relative '../lib/web_scraper'
require_relative '../lib/whole_web'

class Display
  def front_page
    crawler = Crawler.new
    job = crawler.take_title
    description = crawler.take_description

    job.each_with_index do |_item, index|
      puts "==============================================\n"
      puts "job: #{job[index]}"
      puts "description:  #{description[index]}\n\n"
    end
  end

  def whole_web
    crawler_whole = Web.new
    job_whole_web = crawler_whole.all_title
    title_whole_web = crawler_whole.all_description

    job_whole_web.each_with_index do |_item, index|
      puts "==============================================\n"
      puts "job: #{job_whole_web[index]}"
      puts "description:  #{title_whole_web[index]}\n\n"
    end
  end
end

scrape = Display.new
scrape.front_page

scrape_all = Display.new
scrape_all.whole_web
