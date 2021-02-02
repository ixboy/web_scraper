require 'colorize'
require 'httparty'
require 'nokogiri'
require_relative 'config'
class Pagination < Scraper
  attr_accessor :doc

  def run
    while page <= last_page && !flag
      self.last_page = (total.to_f / start.count).round
      doc.each do |movie|
        film = {
          title: movie.css('.qtip-title').text,
          quality: movie.css('.jtip-quality').text,
          year: movie.css('div.jt-info a').text.gsub(/\D/, ''),
          url: movie.css('div.jtip-bottom a')[0].attributes['href'].value,
          ratings: movie.css('div .jt-imdb').text
        }
        movies << film
        puts '=============================================================================='.light_blue
        puts " #{count} -  Movie:".light_blue + " #{film[:title]}  ||".light_cyan + '    *Quality'.light_blue + "  #{film[:quality]}".yellow
        puts "\n"
        puts '       Year of released:'.light_blue + " #{film[:year]}          ".light_cyan + '     *Ratings:'.light_blue + (film[:ratings]).to_s.yellow
        puts "\n"
        puts "\n"
        puts "       stream or download it Now --->       #{film[:url]}".light_red
        puts '*******************************************************************************'.light_blue
        self.count += 1
      end
      puts '_______________________________________________________________________________'.light_blue
      puts "   |THIS IS PAGE: #{page}.        THIS WEBSITE HAS #{last_page} MORE PAGES.|".blue
      puts "   |         THERE ARE #{start.count} MOVIES ON THIS PAGE.              |".light_blue.underline
      puts "\n"
      puts '   Type '.magenta + 'exit'.red + ' to stop the the scraping tool...'.light_magenta
      puts '   Type '.magenta + 'previous '.red + 'to go back to previous page...'.light_magenta
      puts '   Type '.magenta + 'any key'.red + ' to continue to the next page...'.light_magenta
      self.command = gets.chomp.downcase
      if command == 'previous'
        self.count -= (start.count * 2)
        self.count = 1 if self.count <= 40
      end
      choice
      clear_terminal
    end
    movies
  end
end
