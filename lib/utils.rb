module Utilities
  def self.clear_terminal
    if RUBY_PLATFORM =~ /win32|win64|\.NET|windows|cygwin|mingw32/i
      system('cls')
    else
      system('clear')
    end
  end

  def self.thanks
    puts '           ***********You terminated the program!!!!************'.light_green
    puts '           ***********Thank You! for using this tool************'.light_green
    puts '           ******************Enjoy your movie*******************'.light_green
    puts '           *****You can always come back for more movies :D*****'.light_green
    puts "\n"
    puts "\n"
    puts '           ***********Created by: Ismael. Aka Ixboy**************'.light_yellow
  end
end
