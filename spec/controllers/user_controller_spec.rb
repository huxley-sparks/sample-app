require 'spec_helper'

describe UserController do
	render_views

  describe "GET 'new'" do

	before(:each) do
		# use factory user as test
		@user = Factory(:user)
	end

    it "should be successful" do
	  get :show, :id => @user
      response.should be_success
    end

	it "should have the right user" do
		get :show, :id => @user
		assigns(:user).should == @user
	end

	it "should have the right title" do
		get :show, :id => @user
		response.should have_selector("title", :content => @user.name)
	end

	it "should include the user's name" do
		get :show, :id => @user
		response.should have_selector("h1", :content => @user.name)
	end

	it "should have a profile image" do
		get :show, :id => @user
		response.should have_selector("h1>img", :class => "gravatar")
	end

  end

end
