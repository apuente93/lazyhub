require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_content('Lazy Hub') }
    it { should have_title(full_title('')) }
    it { should_not have_title('| Home') }
  end

  describe "Laugh page" do
    before { visit laugh_path }

    it { should have_content('Laugh') }
    it { should have_title(full_title('Laugh')) }
  end

  describe "Game" do
    before { visit game_path }

    it { should have_content('Game') }
    it { should have_title(full_title('Game')) }
  end

  describe "Community" do
    before { visit community_path }

    it { should have_content('Community') }
    it { should have_title(full_title('Community')) }
  end

  describe "About page" do
    before { visit about_path }

    it { should have_content('About') }
    it { should have_title(full_title('About Us')) }
  end

  describe "Contact page" do
    before { visit contact_path }

    it { should have_content('Contact') }
    it { should have_title(full_title('Contact')) }
  end
end