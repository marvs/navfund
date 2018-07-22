# Provider class, where all banks/providers inherit

module Navfund
  class Provider
    attr_reader :funds
    
    def scrape(opts={})
      if opts[:check_ssl] == false
        @document = open(@url, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE).read
      else
        @document = open(@url).read
      end
      @wrapped_document = Nokogiri::HTML(@document)
    end
    
    def self.strip_value(val)
      val.strip.gsub('PHP', '').gsub('USD', '').gsub(',', '').strip
    end
    
    # List supported funds by name
    def fund_names
      funds.map{ |x| x[:name] }
    end
    
    # Check if the fund name is supported
    def valid_fund?(fund)
      fund_names.include?(fund)
    end
    
    # Returns the fund value
    def value
      nil
    end
    
    # Returns the date of the fund values
    def value_at
      nil
    end
    
    # Display all fund values
    def fund_values
      fvals = []
      fund_names.each{ |f| fvals << { :name => f, :value => self.value(f) } }
      fvals
    end
    
    # Generic parser for uitf.com.ph website
    def uitf_com_ph_parser(fund)
      val = nil
      if valid_fund?(fund)
        fname = @wrapped_document.search("[text()*='#{fund}']").first
        if fname
          fval = fname.ancestors('tr').first.search("td[data-title='NAVpu'] div").first rescue nil
        end
        val = Provider.strip_value(fval.text).to_f if fval
      else
        raise InvalidFund
      end
      val
    end
    
    def uitf_com_ph_date_parser
      dtext = @wrapped_document.search("h5").first.text
      dstr = dtext.split("as of").last.strip
      Date.parse(dstr)
    end
    
  end
end
