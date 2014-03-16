require 'spec_helper'

describe "funnies/index" do
  before(:each) do
    assign(:funnies, [
      stub_model(Funny,
        :content => "Content",
        :article => nil
      ),
      stub_model(Funny,
        :content => "Content",
        :article => nil
      )
    ])
  end

  it "renders a list of funnies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Content".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
