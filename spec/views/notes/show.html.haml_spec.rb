require 'spec_helper'

describe "notes/show.html.haml" do
  before(:each) do
    @note = assign(:note, stub_model(Note,
      :text => "Text",
      :color => "",
      :owner => "Owner"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Text/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Owner/)
  end
end
