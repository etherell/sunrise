require 'spec_helper'

describe "Sunrise Manager destroy" do
  subject { page }
  before(:all) do
    @admin = FactoryGirl.create(:admin_user)
    
    @root = FactoryGirl.create(:structure_main)
    @page = FactoryGirl.create(:structure_page, :parent => @root)
    
    @post = FactoryGirl.create(:post, :structure => @page)
  end
  
  context "admin" do
    before(:each) { login_as @admin }

    describe "destroy" do
      before(:each) do
        visit index_path(:model_name => "posts", :parent_id => @page.id, :parent_type => @page.class.name)
        click_link "delete_post_#{@post.id}"
      end
      
      it "should update an object with correct attributes" do
        Post.where(:id => @post.id).first.should be_nil
      end
    end
  end
  
  describe "anonymous user" do
    before(:each) do
      visit index_path(:model_name => "posts", :parent_id => @page.id, :parent_type => @page.class.name)
    end
    
    it "should redirect to login page" do
      should have_content('Sign in')
    end
  end
end