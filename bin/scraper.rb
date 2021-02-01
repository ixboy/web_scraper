#!/usr/bin/env ruby
require 'colorize'
require_relative '../lib/pagination'
scraper = Pagination.new
scraper.run
def thanks
  puts '           ***********You terminated the program!!!!************'.light_green
  puts '           ***********Thank You! for using this tool************'.light_green
  puts '           ******************Enjoy your movie*******************'.light_green
  puts '           *****You can always come back for more movies :D*****'.light_green
  puts "\n"
  puts "\n"
  puts '           ***********Created by: Ismael. Aka Ixboy**************'.green
end

thanks
