require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe Admin::CarModelsController do

  # This should return the minimal set of attributes required to create a valid
  # Admin::CarModel. As you add validations to Admin::CarModel, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # Admin::CarModelsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all admin_car_models as @admin_car_models" do
      car_model = Admin::CarModel.create! valid_attributes
      get :index, {}, valid_session
      assigns(:admin_car_models).should eq([car_model])
    end
  end

  describe "GET show" do
    it "assigns the requested admin_car_model as @admin_car_model" do
      car_model = Admin::CarModel.create! valid_attributes
      get :show, {:id => car_model.to_param}, valid_session
      assigns(:admin_car_model).should eq(car_model)
    end
  end

  describe "GET new" do
    it "assigns a new admin_car_model as @admin_car_model" do
      get :new, {}, valid_session
      assigns(:admin_car_model).should be_a_new(Admin::CarModel)
    end
  end

  describe "GET edit" do
    it "assigns the requested admin_car_model as @admin_car_model" do
      car_model = Admin::CarModel.create! valid_attributes
      get :edit, {:id => car_model.to_param}, valid_session
      assigns(:admin_car_model).should eq(car_model)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Admin::CarModel" do
        expect {
          post :create, {:admin_car_model => valid_attributes}, valid_session
        }.to change(Admin::CarModel, :count).by(1)
      end

      it "assigns a newly created admin_car_model as @admin_car_model" do
        post :create, {:admin_car_model => valid_attributes}, valid_session
        assigns(:admin_car_model).should be_a(Admin::CarModel)
        assigns(:admin_car_model).should be_persisted
      end

      it "redirects to the created admin_car_model" do
        post :create, {:admin_car_model => valid_attributes}, valid_session
        response.should redirect_to(Admin::CarModel.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved admin_car_model as @admin_car_model" do
        # Trigger the behavior that occurs when invalid params are submitted
        Admin::CarModel.any_instance.stub(:save).and_return(false)
        post :create, {:admin_car_model => {}}, valid_session
        assigns(:admin_car_model).should be_a_new(Admin::CarModel)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Admin::CarModel.any_instance.stub(:save).and_return(false)
        post :create, {:admin_car_model => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested admin_car_model" do
        car_model = Admin::CarModel.create! valid_attributes
        # Assuming there are no other admin_car_models in the database, this
        # specifies that the Admin::CarModel created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Admin::CarModel.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => car_model.to_param, :admin_car_model => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested admin_car_model as @admin_car_model" do
        car_model = Admin::CarModel.create! valid_attributes
        put :update, {:id => car_model.to_param, :admin_car_model => valid_attributes}, valid_session
        assigns(:admin_car_model).should eq(car_model)
      end

      it "redirects to the admin_car_model" do
        car_model = Admin::CarModel.create! valid_attributes
        put :update, {:id => car_model.to_param, :admin_car_model => valid_attributes}, valid_session
        response.should redirect_to(car_model)
      end
    end

    describe "with invalid params" do
      it "assigns the admin_car_model as @admin_car_model" do
        car_model = Admin::CarModel.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Admin::CarModel.any_instance.stub(:save).and_return(false)
        put :update, {:id => car_model.to_param, :admin_car_model => {}}, valid_session
        assigns(:admin_car_model).should eq(car_model)
      end

      it "re-renders the 'edit' template" do
        car_model = Admin::CarModel.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Admin::CarModel.any_instance.stub(:save).and_return(false)
        put :update, {:id => car_model.to_param, :admin_car_model => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested admin_car_model" do
      car_model = Admin::CarModel.create! valid_attributes
      expect {
        delete :destroy, {:id => car_model.to_param}, valid_session
      }.to change(Admin::CarModel, :count).by(-1)
    end

    it "redirects to the admin_car_models list" do
      car_model = Admin::CarModel.create! valid_attributes
      delete :destroy, {:id => car_model.to_param}, valid_session
      response.should redirect_to(admin_car_models_url)
    end
  end

end
