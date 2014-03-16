require 'spec_helper'

describe "funnies/show" do
  before(:each) do
    @funny = assign(:funny, stub_model(Funny,
      :article => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
