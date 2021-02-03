require 'httparty'
require 'nokogiri'
require_relative '../lib/config'
require_relative '../lib/pagination'
fake_url = 'https://fmovies.to/movies'
def testing(url)
  parsed = Nokogiri::HTML(HTTParty.get(url).body)
  parsed.css(('.filmlist'))
end
testing(fake_url)

scraper = Scraper.new

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
    it 'should NOT be true' do
      expected = scraper.flag
      expect(expected).not_to be true
    end
    it 'should be an Array' do
      expected = scraper.movies
      expect(expected).to be_a(Array)
    end
    it 'should be an Integer' do
      expected = scraper.count
      expect(expected).to be_a(Integer)
    end
    it 'should not be zero' do
      expected = scraper.count
      expect(expected).not_to eql(0)
    end
    it 'should be an Integer' do
      expected = scraper.page
      expect(expected).to be_a(Integer)
    end
    it 'should not be zero' do
      expected = scraper.count
      expect(expected).not_to eql(0)
    end
  end

  describe '#start' do
    it 'should be a Nokogori NodeSet' do
      expect(scraper.send(:start)).to be_a(Object)
    end
    it 'should not be a string' do
      expect(scraper.send(:start)).to_not be_a(String)
    end
    it 'should not return a different movie page' do
      expect(scraper.send(:start)).to_not eql(testing(fake_url))
    end
  end

  describe '#choice' do
    it 'should return true values only' do
      expect(scraper.send(:choice)).to be_truthy
    end
    it 'should not be falsey' do
      expect(scraper.send(:choice)).to_not be_falsey
    end
  end
end
