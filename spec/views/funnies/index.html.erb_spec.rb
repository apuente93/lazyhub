require 'spec_helper'

describe "funnies/index" do
  before(:each) do
    assign(:funnies, [
      stub_model(Funny,
        :article => nil
      ),
      stub_model(Funny,
        :article => nil
      )
    ])
  end

  it "renders a list of funnies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
