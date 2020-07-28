require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Registration' do
    
    before do
      @user1 = User.new(:name => "Ali AlShaikhly", :email => "ali@example.com", :password => "123456", :password_confirmation => "123456")
      @user2 = User.new(:name => "Ali AlShaikhly", :email => "aLI@example.com", :password => "123456", :password_confirmation => "123456")
      @user3 = User.new(:name => "Ali AlShaikhly", :email => "hello@example.com", :password => "12345", :password_confirmation => "12345")
      @user1.save

      @login = User.create(:email => "ali@example.com", :password => "123456")
    end

    describe "Validattions" do
      
      it "creates a user with all the fields required" do
        expect(@user1.name).to be_present
        expect(@user1.email).to be_present
        expect(@user1.password).to be_present
        expect(@user1.password_confirmation).to eql(@user1.password)
      end

      it "does not care about case senstitive email" do
        expect(@user2).to_not be_valid
        expect(@user2.errors.full_messages).to include("Email has already been taken")
      end

      it "doesn't allow passwords less than 6 charcaters" do
        expect(@user3).to_not be_valid
        expect(@user3.errors.full_messages).to include("Password must be 6 characters")
      end
    end

    describe '.authenticate_with_credentials' do
        
      it "redirects to the home page if login is successful" do
        expect(@login.authenticate_with_credentials("ali@example.com", "123456")).to be_instance_of(User)
      end

      it "returns nil if the credentials are incorrect" do
        expect(@login.authenticate_with_credentials("ali@example.net", "123")).to be_nil
      end

      it "it should still login if the user adds spaces" do
        expect(@login.authenticate_with_credentials("    ali@example.com", "123456")).to be_instance_of(User)
      end

      it "logs the user in even if the email is typed in different upper cases" do
        expect(@login.authenticate_with_credentials("aLi@exaMple.com", "123456")).to be_instance_of(User)
      end
    end

  end
end
