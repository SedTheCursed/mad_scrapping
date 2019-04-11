require "rubygems"
require "nokogiri"
require "open-uri"
require "pry"

URL = "https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes&pagnum=600&debut_deputes=500#pagination_deputes"

def open_page(url)
  Nokogiri::HTML(open(url))
end

def get_congressmen(url)
  page = open_page(url)
  congressmen_info = []
  congressmen = page.xpath('/html/body/div[1]/main/div/div/div[1]/ul')
  congressmen.each do |congressman|
    title = congressman.css("h2").text.sub(/^M(me)? /, "").split(" ")
    first_name = title[0]
    title.delete(first_name)
    last_name = title.join(" ")
    congressmen_info << {first_name: first_name, last_name: last_name}
    binding.pry
  end
end

get_congressmen(URL)
