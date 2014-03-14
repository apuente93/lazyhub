require 'spec_helper'

describe "articles/edit" do
  before(:each) do
    @article = assign(:article, stub_model(Article,
      :upvote => 1,
      :downvote => 1,
      :content => "MyText"
    ))
  end

  it "renders the edit article form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", article_path(@article), "post" do
      assert_select "input#article_upvote[name=?]", "article[upvote]"
      assert_select "input#article_downvote[name=?]", "article[downvote]"
      assert_select "textarea#article_content[name=?]", "article[content]"
    end
  end
end
