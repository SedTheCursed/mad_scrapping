require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

URL = "https://coinmarketcap.com/all/views/all/"

def crypto_scrapper_with_css(url)
  page = Nokogiri::HTML(open(url))
  cryptos = page.css("tbody tr")
  crypto_array = []
  cryptos.each{|crypto|
    symbol = crypto.css("td.col-symbol").text
    price = crypto.css("td a.price").text.sub(/^\$/, "").to_f
    crypto_array << { symbol => price}
  }
  crypto_array
end

=begin
def crypto_scrapper_with_xpath(url)
  page = Nokogiri::HTML(open(url))
  number_of_cryptos = page.xpath('//tbody/tr').count
  crypto_array = []
  for index in 1..number_of_cryptos do
    symbol = page.xpath('//tbody/tr[' + index.to_s + ']/td[3]').text
    price = page.xpath('//tbody/tr[' + index.to_s + ']/td[5]').text.sub(/^\$/, "").to_f
    crypto_array << { symbol => price}
  end
  crypto_array
end
=end

def crypto_scrapper_with_xpath(url)
  page = Nokogiri::HTML(open(url))
  crypto_array = []
  raw_symbols = page.xpath('//td[3]')
  array_of_symbols=[]
  raw_symbols.each do |symbol|
    raw_symbols = symbol.text
    array_of_symbols << raw_symbols
  end
  raw_prices = page.xpath('//td[5]')
  array_of_prices=[]
  raw_prices.each do |price|
    raw_prices = price.text.sub(/^\$/, "").to_f
    array_of_prices << raw_prices
  end
  array_of_symbols.count.times do |index|
    crypto_array << {array_of_symbols[index] => array_of_prices[index]}
  end  
  crypto_array
end