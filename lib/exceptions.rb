module Exceptions

  class InsufficientFundsError < StandardError

    def initialize
    end

    def message
      "You do not have enough funds in your account"
    end
  end
end
