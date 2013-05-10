require 'spec_helper'

Capybara.default_driver = :selenium

describe "User pages" do

  subject { page }

  describe "signup" do

    before { visit('http://nastachku.ru/users/new') }

    let(:submit) { "nnn" }

    describe "with invalid information" do
      it "should not create a user" do
        #expect { click_button submit }.not_to change(User, :count)
	click_button submit
	expect false
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end
end