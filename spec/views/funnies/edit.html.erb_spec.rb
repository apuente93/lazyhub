require 'spec_helper'

describe "funnies/edit" do
  before(:each) do
    @funny = assign(:funny, stub_model(Funny,
      :content => "MyString",
      :article => nil
    ))
  end

  it "renders the edit funny form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", funny_path(@funny), "post" do
      assert_select "input#funny_content[name=?]", "funny[content]"
      assert_select "input#funny_article[name=?]", "funny[article]"
    end
  end
end
