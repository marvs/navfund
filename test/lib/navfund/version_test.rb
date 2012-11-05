require_relative '../../test_helper'

describe Navfund do
  it "must be defined" do
    Navfund::VERSION.wont_be_nil
  end
end
