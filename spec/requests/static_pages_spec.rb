require 'spec_helper'

describe "StaticPages" do
  
  #setup pieces common to all tests
  subject {page}
  shared_examples_for "all static pages" do
    it {should have_selector('h1', text: heading)}
    it {should have_selector('title', text: full_title(page_title))}
  end

  describe "Home page" do
    before {visit root_path}
    let(:page_title) {''}
    let(:heading) {'Sample App'}
    it_should_behave_like "all static pages"
    it {should_not have_selector('title', text: "| Home")}
  end
  
  describe "Help page" do
    before {visit help_path}
    let(:page_title) {'Help'}
    let(:heading) {'Help'}
    
    it_should_behave_like "all static pages"
  end
  
  describe "About page" do
    before {visit about_path}
    let(:page_title) {'About'}
    let(:heading) {'About'}
    
    it_should_behave_like "all static pages"
  end
  
  describe "Contact page" do
    before {visit contact_path}
    let(:page_title) {'Contact'}
    let(:heading) {'Contact'}
    
    it_should_behave_like "all static pages"
  end
  
  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    page.should have_selector 'title', text: full_title('About Us')
    click_link "Help"
    page.should have_selector('title', text: full_title('Help'))
    click_link "Contact"
    page.should have_selector('title', text: full_title('Contact'))
    click_link "Home"
    click_link "Sign up now!"
    page.should have_selector('title', text: full_title('Sign Up'))
    click_link "sample app"
    page.should have_selector('title', text: full_title(''))
  end
  
  #the default test
  #describe "GET /static_pages" do
  #  it "works! (now write some real specs)" do
  #    # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
  #    get root_path
  #    response.status.should be(200)
  #  end
  #end
  
end