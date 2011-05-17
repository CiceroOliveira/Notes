require 'spec_helper'

describe "notes/new.html.haml" do
  before(:each) do
    assign(:note, stub_model(Note,
      :text => "MyString",
      :color => "",
      :owner => "MyString"
    ).as_new_record)
  end

  it "renders new note form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => notes_path, :method => "post" do
      assert_select "input#note_text", :name => "note[text]"
      assert_select "select#note_color", :name => "note[color]"
      assert_select "input#note_owner", :name => "note[owner]"
    end
  end
end
