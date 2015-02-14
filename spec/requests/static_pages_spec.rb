require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_content('Lazy Hub') }
    it { should have_title(full_title('')) }
    it { should_not have_title('| Home') }

    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      let!(:article) { FactoryGirl.create(:article, user: user, content: "Foo", article_type: "Laugh") }
      before do
        FactoryGirl.create(:comment, user: user, article: article, content: "Lorem ipsum")
        FactoryGirl.create(:comment, user: user, article: article, content: "Dolor sit amet")
        sign_in user
        visit root_path
      end
    end
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

  describe "News" do
    before { visit news_path }

    it { should have_content('News') }
    it { should have_title(full_title('News')) }
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