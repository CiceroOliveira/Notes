require 'spec_helper'

describe "notes/index.html.haml" do
  before(:each) do
    assign(:notes, [
      stub_model(Note,
        :text => "Text",
        :color => "",
        :owner => "Owner"
      ),
      stub_model(Note,
        :text => "Text",
        :color => "",
        :owner => "Owner"
      )
    ])
  end

  it "renders a list of notes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "li>p", :text => "Text".to_s, :count => 2
  end
end
