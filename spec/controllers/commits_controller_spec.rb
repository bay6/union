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

describe CommitsController do

  # This should return the minimal set of attributes required to create a valid
  # Commit. As you add validations to Commit, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "commit_date" => "2013-07-05 08:20:44" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CommitsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all commits as @commits" do
      commit = Commit.create! valid_attributes
      get :index, {}, valid_session
      assigns(:commits).should eq([commit])
    end
  end

  describe "GET show" do
    it "assigns the requested commit as @commit" do
      commit = Commit.create! valid_attributes
      get :show, {:id => commit.to_param}, valid_session
      assigns(:commit).should eq(commit)
    end
  end

  describe "GET new" do
    it "assigns a new commit as @commit" do
      get :new, {}, valid_session
      assigns(:commit).should be_a_new(Commit)
    end
  end

  describe "GET edit" do
    it "assigns the requested commit as @commit" do
      commit = Commit.create! valid_attributes
      get :edit, {:id => commit.to_param}, valid_session
      assigns(:commit).should eq(commit)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Commit" do
        expect {
          post :create, {:commit => valid_attributes}, valid_session
        }.to change(Commit, :count).by(1)
      end

      it "assigns a newly created commit as @commit" do
        post :create, {:commit => valid_attributes}, valid_session
        assigns(:commit).should be_a(Commit)
        assigns(:commit).should be_persisted
      end

      it "redirects to the created commit" do
        post :create, {:commit => valid_attributes}, valid_session
        response.should redirect_to(Commit.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved commit as @commit" do
        # Trigger the behavior that occurs when invalid params are submitted
        Commit.any_instance.stub(:save).and_return(false)
        post :create, {:commit => { "commit_date" => "invalid value" }}, valid_session
        assigns(:commit).should be_a_new(Commit)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Commit.any_instance.stub(:save).and_return(false)
        post :create, {:commit => { "commit_date" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested commit" do
        commit = Commit.create! valid_attributes
        # Assuming there are no other commits in the database, this
        # specifies that the Commit created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Commit.any_instance.should_receive(:update_attributes).with({ "commit_date" => "2013-07-05 08:20:44" })
        put :update, {:id => commit.to_param, :commit => { "commit_date" => "2013-07-05 08:20:44" }}, valid_session
      end

      it "assigns the requested commit as @commit" do
        commit = Commit.create! valid_attributes
        put :update, {:id => commit.to_param, :commit => valid_attributes}, valid_session
        assigns(:commit).should eq(commit)
      end

      it "redirects to the commit" do
        commit = Commit.create! valid_attributes
        put :update, {:id => commit.to_param, :commit => valid_attributes}, valid_session
        response.should redirect_to(commit)
      end
    end

    describe "with invalid params" do
      it "assigns the commit as @commit" do
        commit = Commit.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Commit.any_instance.stub(:save).and_return(false)
        put :update, {:id => commit.to_param, :commit => { "commit_date" => "invalid value" }}, valid_session
        assigns(:commit).should eq(commit)
      end

      it "re-renders the 'edit' template" do
        commit = Commit.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Commit.any_instance.stub(:save).and_return(false)
        put :update, {:id => commit.to_param, :commit => { "commit_date" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested commit" do
      commit = Commit.create! valid_attributes
      expect {
        delete :destroy, {:id => commit.to_param}, valid_session
      }.to change(Commit, :count).by(-1)
    end

    it "redirects to the commits list" do
      commit = Commit.create! valid_attributes
      delete :destroy, {:id => commit.to_param}, valid_session
      response.should redirect_to(commits_url)
    end
  end

end
