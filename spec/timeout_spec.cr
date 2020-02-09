require "./spec_helper"

describe Timeout do
  it "returns the block value if its returned early enough" do
    Timeout(String).try_for 1.second do
      "result"
    end.should eq "result"
  end
  it "raises an exception if the timeout period is reached" do
    expect_raises Timeout::Reached do
      Timeout(String).try_for 1.second do
        sleep 1.1.seconds
        "result"
      end
    end
  end
end
