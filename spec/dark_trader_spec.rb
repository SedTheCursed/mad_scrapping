require_relative "../lib/dark_trader"

describe "The crypto_scrapper_with_css function" do
  it "returns an array not null" do
    expect(crypto_scrapper_with_css("https://coinmarketcap.com/all/views/all/")).not_to eq(nil)
  end

  it "returns an array bigger than a thousand" do
    cryptos = crypto_scrapper_with_css("https://coinmarketcap.com/all/views/all/")
    expect(cryptos.count).to be > 1000
  end
end

describe "The crypto_scrapper_with_xpath function" do
  it "returns an array not null" do
    expect(crypto_scrapper_with_xpath("https://coinmarketcap.com/all/views/all/")).not_to eq(nil)
  end

  it "returns an array bigger than a thousand" do
    cryptos = crypto_scrapper_with_xpath("https://coinmarketcap.com/all/views/all/")
    expect(cryptos.count).to be > 1000
  end
  it "check for BTC" do
    cryptos = crypto_scrapper_with_xpath("https://coinmarketcap.com/all/views/all/")
    expect(crypto_scrapper_with_xpath(URL).any?{|a| a["BTC"]}).to be true
  end
  it "check for ETH" do
    cryptos = crypto_scrapper_with_xpath("https://coinmarketcap.com/all/views/all/")
    expect(crypto_scrapper_with_xpath(URL).any?{|a| a["ETH"]}).to be true
  end
  it "check for non existing value" do
    cryptos = crypto_scrapper_with_xpath("https://coinmarketcap.com/all/views/all/")
    expect(crypto_scrapper_with_xpath(URL).any?{|a| a["toto"]}).to be false
  end
end
