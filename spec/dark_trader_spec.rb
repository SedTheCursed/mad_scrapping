require_relative "../lib/dark_trader"

describe "The crypto_scrapper function" do
  it "returns an array not null" do
    expect(crypto_scrapper("https://coinmarketcap.com/all/views/all/")).not_to eq(nil)
  end
  
  it "returns an array bigger than a thousand" do
    cryptos = crypto_scrapper("https://coinmarketcap.com/all/views/all/")
    expect(cryptos.count).to be > 1000
  end
end