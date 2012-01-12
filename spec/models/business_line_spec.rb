require 'spec_helper'

describe BusinessLine do
  describe 'monthly_gross_revenue' do
    it "calculates with good values" do
      b = BusinessLine.new
      b.margin = 0.50
      b.monthly_revenue = 10_000
      b.monthly_gross_revenue.should == 5_000

      c = BusinessLine.new(margin: 0.40, monthly_revenue: 4_000)
      c.monthly_gross_revenue.should == 1_600
    end

    it "works with nil margin" do
      c = BusinessLine.new(margin: nil, monthly_revenue: 4_000)
      c.monthly_gross_revenue.should == 0    
    end
  end
end
