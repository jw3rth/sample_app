require 'spec_helper'

describe "LayoutLinks" do
	it "should have a Home page at '/'" do 
		get '/'
		response.should have_selector('title', :content =>"Home")
	end

	it "should have a contact page at '/contact'" do
		get '/contact'
		response.should have_selector('title', :content => "Contact")
	end

 
	it "should have an About title at '/about'" do
		get '/about'
		response.should have_selector('title', :content => "About")
	end


	it "should have an signup page  at '/signup'" do
		get '/signup'
		response.should have_selector('title', :content => "Sign up")
	end

	it "should have the right links on the layout" do
		visit root_path 
		response.should have_selector('title', :content => "Home")
		click_link "About"
		response.should have_selector('title', :content => "About")
		click_link "Contact"
		response.should have_selector('title', :content => "Contact")
		click_link "Home"

		click_link "Sign Up Now!"
		response.should have_selector('title', :content => "Sign up" )
		response.should have_selector('a[href="/"]>img')
	end	


end
