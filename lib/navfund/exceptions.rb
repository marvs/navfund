# Main module

module Navfund

  class InvalidProvider < StandardError
    def initialize(msg = "The provider you entered is not supported!")
      super
    end
  end
  
  class Provider
    class InvalidFund < StandardError
      def initialize(msg = "The fund name you entered is not supported!")
        super
      end
    end
  end
  
end
