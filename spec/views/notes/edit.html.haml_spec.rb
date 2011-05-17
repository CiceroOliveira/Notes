require 'spec_helper'

describe "notes/edit.html.haml" do
  before(:each) do
    @note = assign(:note, stub_model(Note,
      :text => "Yellow note",
      :color => "yellow",
      :owner => "cicero"
    ))
  end

  it "renders the edit note form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => notes_path(@note), :method => "post" do
      assert_select "input#note_text", :name => "note[text]"
      assert_select "select#note_color", :name => "note[color]"
      assert_select "input#note_owner", :name => "note[owner]"
    end
  end
end
