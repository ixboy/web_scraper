class Scraper
  attr_accessor :page, :url, :p_url, :films_per_page, :last_page, :movies, :flag, :total, :command, :count

  def initialize
    self.page = 1
    self.total = 9071
    self.last_page = 10
    self.movies = []
    self.flag = false
    self.count = 1
  end

  def start
    self.url = 'https://gostream.site/123movies/'
    self.p_url = url + "page/#{page}"
    puts "\n"
    parsed_page = Nokogiri::HTML(HTTParty.get(p_url).body)
    self.doc = parsed_page.css('div #hidden_tip')
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
  private :start, :clear_terminal
end
