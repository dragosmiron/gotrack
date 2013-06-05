require 'spec_helper'
describe TasksHelper do
  describe "#get_previous_day" do
    context "correct parameter provided" do
      it "returns previous day from the date provided" do
        helper.get_previous_day("2012-02-04").should == Date.parse("2012-02-03")
      end
    end
    context "incorrect parameter provided" do
      it "returns previous day from today" do
        helper.get_previous_day("something").should == Date.today - 1.day
      end
    end
    context "nil parameter provided" do
      it "returns previous day from today" do
        helper.get_previous_day(nil).should == Date.today - 1.day
      end
    end
  end

  describe "#get_next_day" do
    context "correct parameter provided" do
      it "returns previous day from the date provided" do
        helper.get_next_day("2012-02-04").should == Date.parse("2012-02-05")
      end
    end
    context "incorrect parameter provided" do
      it "returns previous day from today" do
        helper.get_next_day("something").should == Date.today + 1.day
      end
    end
    context "nil parameter provided" do
      it "returns previous day from today" do
        helper.get_next_day(nil).should == Date.today + 1.day
      end
    end
  end
end
