class Stock < ActiveRecord::Base
  has_many :user_stocks
  has_many :users, through: :user_stocks

  def self.new_from_lookup(ticker_symbol)
    begin
      looked_up_stock = StockQuote::Stock.quote(ticker_symbol)
      price = strip_commas(looked_up_stock.l)
      new(name: looked_up_stock.name, ticker: looked_up_stock.symbol, last_price: price)
    rescue Exception => e
      nil
    end
  end

  def self.strip_commas(number)
    number.gsub(",", "")
  end

  def self.find_by_ticker(ticker_symbol)
    where(ticker: ticker_symbol).first
  end

  def self.find_by_ticker(ticker_symbol)
    where(ticker: ticker_symbol).first
  end
end
