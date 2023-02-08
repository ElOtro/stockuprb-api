class Tax::Vat::Amount < ApplicationService
  attr_reader :amount, :rate

  def initialize(amount, rate)
    @amount = amount
    @rate = rate
  end

  def call
    amount * (rate / 100).round(2)
  end
end
