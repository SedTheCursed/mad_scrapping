require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

URL = "https://coinmarketcap.com/all/views/all/"

#récupère un tableau de symboles en CSS
#non utilisée

def crypto_scrapper_with_xpath(url)
  page = Nokogiri::HTML(open(url))
  raw_id = page.xpath('//tr/@id')
  array_of_id = []
  raw_id.each{|id|
    array_of_id << id.text
  }
  array_of_hash =[]
  array_of_id.each do |id|
    h={}
    xpath_string = "//*[@id=\"#{id}\"]/td[3]"
    raw_symbol = page.xpath(xpath_string)
    string_symbole = raw_symbol.text
    xpath_string = "//*[@id=\"#{id}\"]/td[5]/*/@data-usd"
    raw_price = page.xpath(xpath_string)
    string_price = raw_price.text
    h[string_symbole] = string_price.to_f
    puts h
    array_of_hash<< h
  end
  puts array_of_hash.inspect
end

crypto_scrapper_with_xpath(URL)

#//*[@id="id-bitcoin"]/td[3]
