require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

URL = "https://coinmarketcap.com/all/views/all/"

def crypto_scrapper(url)
  page = Nokogiri::HTML(open(url))
  raw_symbols = page.css("td.col-symbol")
  array_of_symbols=[]
  raw_symbols.each{|symbol|
  array_of_symbols << symbol.text
}
end

crypto_scrapper(URL)
