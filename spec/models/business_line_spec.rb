require 'spec_helper'

describe BusinessLine do
  
  describe 'monthly_gross_revenue' do
    it "calculates with good values" do
      b = Factory.build :business_line, margin: 0.50, monthly_revenue: 10_000
      b.monthly_gross_revenue.should == 5_000

      c = BusinessLine.new(margin: 0.40, monthly_revenue: 4_000)
      c.monthly_gross_revenue.should == 1_600
    end

    it "works with nil margin" do
      c = BusinessLine.new(margin: nil, monthly_revenue: 4_000)
      c.monthly_gross_revenue.should == 0    
    end

    it "works with nil monthly_revenue" do
      c = BusinessLine.new(margin:0.4, monthly_revenue: nil)
      c.monthly_gross_revenue.should == 0    
    end
  end

  describe 'value_of_position' do
    it 'calculates correctly' do
      b = Factory.build :business_line, 
            position_in_business: 0.4, 
            valuation: 1_000_000

      b.value_of_position.should == 400_000
    end

    it 'works with nil position_in_business' do
      b = Factory.build :business_line, 
            position_in_business: nil

      b.value_of_position.should == 0
    end

    it 'works with nil valuation' do
      b = Factory.build :business_line, valuation: nil
      b.value_of_position.should == 0
    end


  end
end
