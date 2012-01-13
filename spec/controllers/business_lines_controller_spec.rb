require 'spec_helper'

describe BusinessLinesController do

  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all business_lines as @business_lines" do
      business_line = BusinessLine.create! valid_attributes
      get :index
      assigns(:business_lines).should eq([business_line])
    end
  end

  describe "GET show" do
    it "assigns the requested business_line as @business_line" do
      business_line = BusinessLine.create! valid_attributes
      get :show, :id => business_line.id.to_s
      assigns(:business_line).should eq(business_line)
    end
  end

  describe "GET new" do
    it "assigns a new business_line as @business_line" do
      get :new
      assigns(:business_line).should be_a_new(BusinessLine)
    end
  end

  describe "GET edit" do
    it "assigns the requested business_line as @business_line" do
      business_line = BusinessLine.create! valid_attributes
      get :edit, :id => business_line.id.to_s
      assigns(:business_line).should eq(business_line)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new BusinessLine" do
        expect {
          post :create, :business_line => valid_attributes
        }.to change(BusinessLine, :count).by(1)
      end

      it "assigns a newly created business_line as @business_line" do
        post :create, :business_line => valid_attributes
        assigns(:business_line).should be_a(BusinessLine)
        assigns(:business_line).should be_persisted
      end

      it "redirects to the created business_line" do
        post :create, :business_line => valid_attributes
        response.should redirect_to(BusinessLine.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved business_line as @business_line" do
        # Trigger the behavior that occurs when invalid params are submitted
        BusinessLine.any_instance.stub(:save).and_return(false)
        post :create, :business_line => {}
        assigns(:business_line).should be_a_new(BusinessLine)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        BusinessLine.any_instance.stub(:save).and_return(false)
        post :create, :business_line => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested business_line" do
        business_line = BusinessLine.create! valid_attributes
        # Assuming there are no other business_lines in the database, this
        # specifies that the BusinessLine created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        BusinessLine.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => business_line.id, :business_line => {'these' => 'params'}
      end

      it "assigns the requested business_line as @business_line" do
        business_line = BusinessLine.create! valid_attributes
        put :update, :id => business_line.id, :business_line => valid_attributes
        assigns(:business_line).should eq(business_line)
      end

      it "redirects to the business_line" do
        business_line = BusinessLine.create! valid_attributes
        put :update, :id => business_line.id, :business_line => valid_attributes
        response.should redirect_to(business_line)
      end
    end

    describe "with invalid params" do
      it "assigns the business_line as @business_line" do
        business_line = BusinessLine.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        BusinessLine.any_instance.stub(:save).and_return(false)
        put :update, :id => business_line.id.to_s, :business_line => {}
        assigns(:business_line).should eq(business_line)
      end

      it "re-renders the 'edit' template" do
        business_line = BusinessLine.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        BusinessLine.any_instance.stub(:save).and_return(false)
        put :update, :id => business_line.id.to_s, :business_line => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested business_line" do
      business_line = BusinessLine.create! valid_attributes
      expect {
        delete :destroy, :id => business_line.id.to_s
      }.to change(BusinessLine, :count).by(-1)
    end

    it "redirects to the business_lines list" do
      business_line = BusinessLine.create! valid_attributes
      delete :destroy, :id => business_line.id.to_s
      response.should redirect_to(business_lines_url)
    end
  end

end
