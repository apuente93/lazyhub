require 'spec_helper'

describe "funnies/new" do
  before(:each) do
    assign(:funny, stub_model(Funny,
      :content => "MyString",
      :article => nil
    ).as_new_record)
  end

  it "renders new funny form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", funnies_path, "post" do
      assert_select "input#funny_content[name=?]", "funny[content]"
      assert_select "input#funny_article[name=?]", "funny[article]"
    end
  end
end
