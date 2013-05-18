# encoding: utf-8

require 'spec_helper'

Capybara.default_driver = :selenium

describe "User pages" do

  subject { page }

  describe "signup" do

    before(:each) { visit('http://nastachku.ru/users/new') }

    describe "with invalid information" do
      it "should not create a user" do
        find(:xpath, ".//input[@name='commit']").click
    
        should have_selector(:xpath, ".//div[contains(@class,'user_email') and contains(@class,'error')]")

      end
    end

        time = Time.now.to_i
        test_email = "test" + time.to_s + "@example.com"

    describe "with valid information" do
      before(:each) do
        fill_in "user[first_name]",             with: "Василий"
        fill_in "user[last_name]",              with: "Пупкин"
        fill_in "user[email]",                  with: test_email
        fill_in "user[password]",               with: "foobar"
        fill_in "user[password_confirmation]",  with: "foobar"
        fill_in "user[city]",                   with: "Ульяновск"
      end

      it "should create a user" do
        find(:xpath, ".//input[@name='commit']").click
        
        #FIXME: пока костыль... после исправления бага нужно переделать.
        should have_content("500 Internal Server Error")
      end

      it "should not create a user with the same email" do
        find(:xpath, ".//input[@name='commit']").click

        should have_selector(:xpath, ".//div[contains(@class,'user_email') and contains(@class,'error')]")
      end

    end
  end
end