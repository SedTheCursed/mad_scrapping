require "rubygems"
require "nokogiri"
require "open-uri"

def open_page(url)
  Nokogiri::HTML(open(url))
end

def get_townhall_email(url)
  page = open_page(url)
  email = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
  email
end

def get_townhall_urls(url)
  page = open_page(url)
  towns = page.xpath('//td/*/a[@class="lientxt"]')
  towns_emails = []
  towns.each do  |town|
    name = town.text
    href = town["href"]
    url="http://annuaire-des-mairies.com" + href.slice(1, href.length - 1)
    email = get_townhall_email(url)
    towns_emails << { name => email}
  end

  towns_emails
end
