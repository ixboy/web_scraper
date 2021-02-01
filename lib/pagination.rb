require 'colorize'
require 'httparty'
require 'nokogiri'
require_relative 'lib/config'
class Pagination < Scraper
  def run
    while page <= last_page && !flag
      self.url = 'https://gostream.site/123movies/'
      self.p_url = url + "page/#{page}"
      puts "\n"
      parsed_page = Nokogiri::HTML(HTTParty.get(p_url).body)
      doc = parsed_page.css('div #hidden_tip')
      films_per_page = doc.count
      self.last_page = (total.to_f / films_per_page).round
      doc.each do |movie|
        film = {
          title: movie.css('.qtip-title').text,
          quality: movie.css('.jtip-quality').text,
          url: movie.css('div.jtip-bottom a')[0].attributes['href'].value,
          ratings: movie.css('div .jt-imdb').text
        }
        movies << film
        puts '=============================================================================='.light_blue
        puts '   Movie:'.light_blue + " #{film[:title]}  ".light_cyan + "|   *Quality: #{film[:quality]}  |".yellow
        puts "\n"
        puts '   Year of released:'.light_blue + " #{film[:url]}   ".light_cyan + "|   *Ratings: #{film[:ratings]}  |".yellow
        puts "\n"
        puts "\n"
        puts "   stream or download it Now --->       #{film[:url]}".light_red
        puts '*******************************************************************************'.light_blue
      end
      puts '_______________________________________________________________________________'.light_blue
      puts "   |THIS IS PAGE: #{page}.        THIS WEBSITE HAS #{last_page} MORE PAGES.|".blue
      puts "   |         THERE'S #{films_per_page} MOVIES ON THIS PAGE.              |".light_blue.underline
      puts "\n"
      puts '   Please type '.light_blue + 'exit'.red + ' to stop the the scraping tool.'.blue
      puts '   Please type '.light_blue + 'previous '.red + 'to go back to previous page.'.blue
      puts '   Please type '.light_blue + 'any key'.red + ' to continue to the next page...'.blue
      command = gets.chomp.downcase
      case command
      when 'exit'
        self.flag = true
      when 'previous'
        self.page -= 1
      else
        self.page += 1
      end
    end
  end
end
