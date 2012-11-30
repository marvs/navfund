require File.expand_path('../../../test_helper.rb', __FILE__)

describe Navfund do
  it "must be defined" do
    Navfund::VERSION.wont_be_nil
  end
end
