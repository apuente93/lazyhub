require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'Lazy Hub'" do
      visit '/static_pages/home'
      expect(page).to have_content('Lazy Hub')
    end
  end

  describe "Laugh page" do

    it "should have the content 'Laugh'" do
      visit '/static_pages/laugh'
      expect(page).to have_content('Laugh')
    end
  end

  describe "Game page" do

    it "should have the content 'Game'" do
      visit '/static_pages/game'
      expect(page).to have_content('Game')
    end
  end

  describe "Community page" do

    it "should have the content 'Community'" do
      visit '/static_pages/community'
      expect(page).to have_content('Community')
    end
  end

  describe "About page" do

    it "should have the content 'About Us'" do
      visit '/static_pages/about'
      expect(page).to have_content('About Us')
    end
  end
end