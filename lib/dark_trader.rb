require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

URL = "https://coinmarketcap.com/all/views/all/"

def crypto_scrapper(url)
  page = Nokogiri::HTML(open(url))
  page.xpath("//tr")
  binding.pry
end

crypto_scrapper(URL)