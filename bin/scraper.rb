#!/usr/bin/env ruby
require_relative '../lib/config'
require_relative '../lib/utils'
require 'colorize'
require 'httparty'
require 'nokogiri'

class InfoOutput < Scraper
  def pagination
    while page <= last_page && !flag
      self.last_page = (total.to_f / start.count).round
      doc.each do |movie|
        self.film = {
          title: movie.css('.qtip-title').text,
          quality: movie.css('.jtip-quality').text,
          year: movie.css('div.jt-info a').text.gsub(/\D/, ''),
          url: movie.css('div.jtip-bottom a')[0].attributes['href'].value,
          ratings: movie.css('div .jt-imdb').text
        }
        movies << film
        prints
      end
      change_page
      choice
      Utilities.clear_terminal
    end
    movies
  end

  def prints
    puts '=============================================================================='.light_blue
    puts " #{count} -  Movie:".light_blue + " #{film[:title]}  ||"
      .light_cyan + '    *Quality'.light_blue + "  #{film[:quality]}".yellow
    puts "\n"
    puts '       Year of released:'.light_blue + " #{film[:year]}          "
      .light_cyan + '     *Ratings:'.light_blue + film[:ratings].to_s.yellow
    2.times { puts "\n" }
    puts "       stream or download it Now --->       #{film[:url]}".light_red
    puts '*******************************************************************************'.light_blue
    self.count += 1
  end

  def change_page
    puts '_______________________________________________________________________________'.light_blue
    puts "   |THIS IS PAGE: #{page}.        THIS WEBSITE HAS #{last_page} MORE PAGES.|".blue
    puts "   |         THERE ARE #{start.count} MOVIES ON THIS PAGE.              |".light_blue.underline
    puts "\n"
    puts '   Type '.magenta + 'exit'.red + ' to stop the the scraping tool...'.light_magenta
    puts '   Type '.magenta + 'previous '.red + 'to go back to previous page...'.light_magenta
    puts '   Type '.magenta + 'any key'.red + ' to continue to the next page...'.light_magenta
    self.command = gets.chomp.downcase
    self.count -= (start.count * 2) if command == 'previous'
    self.count = 1 if self.count <= 40
  end

  def thanks
    10.times { puts "\n" }
    puts '           ***********You terminated the program!!!!************'.light_green
    puts '           ***********Thank You! for using this tool************'.light_green
    puts '           ******************Enjoy your movie*******************'.light_green
    puts '           *****You can always come back for more movies :D*****'.light_green
    3.times { puts "\n" }
    puts '           Please wait'.light_magenta + ' 5 SECONDS '.light_red + 'for your list of movies...'.light_magenta
    puts "\n"
    puts '           ***********Created by: Ismael. Aka Ixboy**************'.light_yellow
  end
end

scraper = InfoOutput.new
scraper.pagination
scraper.thanks
sleep 5
2.times { puts "\n" }
puts(scraper.movies.map do |x|
  "#{x.values[0]}:   #{x.values[1]} - #{x.values[2]}".magenta + "                 ======>  #{x.values[3]}".light_blue
end.uniq)
