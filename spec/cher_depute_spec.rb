require_relative "../lib/cher_depute"

describe "The open_page function" do
  it "return an HTML document" do
    expect(open_page("https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes&pagnum=600&debut_deputes=500#pagination_deputes").class).to eq(Nokogiri::HTML::Document)
  end
end