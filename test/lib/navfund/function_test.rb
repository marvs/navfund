require_relative '../../test_helper'

describe Navfund do
  before do
    @fund = Navfund::Metrobank.fund("Equity")
  end
  it "should get the fund object" do
    @fund.should_not be_blank
    STDERR.puts "<p>#{@fund.inspect}</p>"
  end
  it "should get the current navpu back in the response" do
    @fund.value.should_not be_blank
  end
end
