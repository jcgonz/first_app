require 'spec_helper'

describe DashboardsController do
  describe 'GET index' do
    it "works" do
      get :index
      response.should be_success
    end

    it "includes all business lines" do
      line1 = Factory :business_line
      line2 = Factory :business_line

      get :index
      
      assigns(:business_lines).should == [line1, line2]
    end

    it 'includes all expenses' do
      exp1 = Factory :expense
      exp2 = Factory :expense

      get :index

      assigns(:expenses_to_show).should == [exp1, exp2]
    end
  end
end