require 'spec_helper'

describe "articles/new" do
  before(:each) do
    assign(:article, stub_model(Article,
      :upvote => 0,
      :downvote => 0,
      :views => 0,
      :content => "MyText"
    ).as_new_record)
  end

  it "renders new article form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", articles_path, "post" do
      assert_select "textarea#article_content[name=?]", "article[content]"
    end
  end
end
