class Scraper
  attr_accessor :page, :url, :p_url, :films_per_page, :last_page, :movies, :flag, :total, :command, :count

  private

  def initialize
    self.page = 1
    # self.total = 9071
    self.last_page = 10
    self.movies = []
    self.flag = false
    self.total = 120 # reducing the pages for testing...
    self.count = 1
  end

  def choice
    case command
    when 'exit'
      self.flag = true
    when 'previous'
      page > 1 ? self.page -= 1 : self.page = 1
    else
      self.page += 1
    end
  end

  def clear_terminal
    if RUBY_PLATFORM =~ /win32|win64|\.NET|windows|cygwin|mingw32/i
      system('cls')
    else
      system('clear')
    end
  end
end
