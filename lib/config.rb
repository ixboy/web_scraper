class Scraper
  attr_accessor :page, :url, :p_url, :films_per_page, :last_page, :movies, :flag, :total

  private

  def initialize
    self.page = 1
    # self.total = 9071
    self.last_page = 10
    self.movies = []
    self.flag = false
    self.total = 120 # reducing the pages for testing...
  end
end
