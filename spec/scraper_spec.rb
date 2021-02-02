require 'httparty'
require 'nokogiri'
require_relative '../lib/config'
require_relative '../lib/pagination'
url = 'https://fmovies.to/movies'
def testing(url)
  unparsed = HTTParty.get(url)
  parsed = Nokogiri::HTML(unparsed)
  parsed.css('.filmlist')
end
testing(url)

scraper = Scraper.new

describe '#testing' do
  it 'should be a Nokogori NodeSet' do
    expect(testing(url)).to be_a(Object)
  end
end

describe Scraper do
  describe '#initialize' do
    it 'should be the value of total pages' do
      expected = scraper.total
      value = 9071
      expect(expected).to eql(value)
    end
    it 'should be false' do
      expected = scraper.flag
      expect(expected).to be_falsey
    end
    it 'should be an Array' do
      expected = scraper.movies
      expect(expected).to be_a(Array)
    end
  end

  describe '#choice' do
    it 'should return true values only' do
      expected = scraper.choice
      expect(expected).to be_truthy
    end
  end
end
