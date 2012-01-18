require 'spec_helper'

describe ExpensesController do

  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all expenses as @expenses" do
      expense = Factory :expense
      get :index
      assigns(:expenses).should eq([expense])
    end
  end

  describe "GET show" do
    it "assigns the requested expense as @expense" do
      expense = Expense.create! valid_attributes
      get :show, :id => expense.id.to_s
      assigns(:expense).should eq(expense)
    end
  end

  describe "GET new" do
    it "assigns a new expense as @expense" do
      get :new
      assigns(:expense).should be_a_new(Expense)
    end
  end

  describe "GET edit" do
    it "assigns the requested expense as @expense" do
      expense = Expense.create! valid_attributes
      get :edit, :id => expense.id.to_s
      assigns(:expense).should eq(expense)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Expense" do
        expect {
          post :create, :expense => valid_attributes
        }.to change(Expense, :count).by(1)
      end

      it "assigns a newly created expense as @expense" do
        post :create, :expense => valid_attributes
        assigns(:expense).should be_a(Expense)
        assigns(:expense).should be_persisted
      end

      it "redirects to the created expense" do
        post :create, :expense => valid_attributes
        response.should redirect_to(Expense.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved expense as @expense" do
        # Trigger the behavior that occurs when invalid params are submitted
        Expense.any_instance.stub(:save).and_return(false)
        post :create, :expense => {}
        assigns(:expense).should be_a_new(Expense)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Expense.any_instance.stub(:save).and_return(false)
        post :create, :expense => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested expense" do
        expense = Expense.create! valid_attributes
        # Assuming there are no other expenses in the database, this
        # specifies that the Expense created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Expense.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => expense.id, :expense => {'these' => 'params'}
      end

      it "assigns the requested expense as @expense" do
        expense = Expense.create! valid_attributes
        put :update, :id => expense.id, :expense => valid_attributes
        assigns(:expense).should eq(expense)
      end

      it "redirects to the expense" do
        expense = Expense.create! valid_attributes
        put :update, :id => expense.id, :expense => valid_attributes
        response.should redirect_to(expense)
      end
    end

    describe "with invalid params" do
      it "assigns the expense as @expense" do
        expense = Expense.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Expense.any_instance.stub(:save).and_return(false)
        put :update, :id => expense.id.to_s, :expense => {}
        assigns(:expense).should eq(expense)
      end

      it "re-renders the 'edit' template" do
        expense = Expense.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Expense.any_instance.stub(:save).and_return(false)
        put :update, :id => expense.id.to_s, :expense => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested expense" do
      expense = Expense.create! valid_attributes
      expect {
        delete :destroy, :id => expense.id.to_s
      }.to change(Expense, :count).by(-1)
    end

    it "redirects to the expenses list" do
      expense = Expense.create! valid_attributes
      delete :destroy, :id => expense.id.to_s
      response.should redirect_to(expenses_url)
    end
  end

end
