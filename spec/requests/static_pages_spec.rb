require 'spec_helper'

describe "StaticPages" do
  
  #setup pieces common to all tests
  let(:base_title) { "Ruby on Rails Tutorial Sample App" }
  subject {page}
  
  #the default test
  describe "GET /static_pages" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get root_path
      response.status.should be(200)
    end
  end
  

  describe "Home page" do
    before {visit root_path}
    it { should have_selector('h1', text: "Sample App") }
    it { should have_selector('title', text: base_title) } #uses base_title defined in above 'let'
    it { should have_selector('title', text: full_title('')) } #uses full_title fn defined in support/utilities.rb
    it { should_not have_selector('title', text: "| Home") }

  end
  
  describe "Help page" do
    before {visit help_path}
    it {should have_selector('h1', text: "Help")}
    it {should have_selector('title', text: full_title('Help'))}
  end
  
  describe "About page" do
    before {visit about_path}
    it {should have_selector('h1', text: "About Us")}
    it {should have_selector('title', text: full_title("About Us"))}
  end
  
  describe "Contact page" do
    before {visit contact_path}
    it {should have_selector('h1', text: "Contact")}
    it {should have_selector('title', text: full_title("Contact"))}
  end

  
end