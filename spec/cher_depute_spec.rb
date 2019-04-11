require_relative "../lib/cher_depute"

describe "The open_page function" do
  it "return an HTML document" do
    expect(open_page("https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes&pagnum=600&debut_deputes=500#pagination_deputes").class).to eq(Nokogiri::HTML::Document)
  end

  it "Return the first name and last name of a congressman" do
    expect(get_congressmen("https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes&pagnum=600&debut_deputes=500#pagination_deputes").any?{|a| a[:first_name] == "Marielle" && a[:last_name] == "de Sarnez" && a[:email]=="marielle.desarnez@assemblee-nationale.fr" }).to be true
  end
end
