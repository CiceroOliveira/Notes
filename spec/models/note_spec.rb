require 'spec_helper'

describe Note do
  let (:note) { Factory(:note) }
  
  describe "validation of text" do
    it "fails without content" do
      note.text = ''
      note.should have(1).error_on(:text)
    end
    
    it "passes with content" do
      note.text = "Text"
      note.should have(0).errors_on(:text)
    end
  end
  
  describe "validation of color" do
    it "fails without content" do
      note.color = ''
      note.should have(1).error_on(:color)
    end
    
    it "passes with content" do
      note.color = "yellow"
      note.should have(0).errors_on(:color)
    end
    
    it "should have a valid color" do
      note.color = "yellow"
      Note::COLORS.should include(note.color)
    end
    
    it "fails when color is invalid" do
      note.color = "invalid_color"
      #Note::COLORS.should include(note.color)
      note.should have(1).errors_on(:color)
    end
  end
  
  describe "validation of owner" do
    it "fails without content" do
      note.owner = ''
      note.should have(1).error_on(:owner)
    end
    
    it "passes with content" do
      note.owner = "Owner"
      note.should have(0).errors_on(:owner)
    end
  end
  
end
