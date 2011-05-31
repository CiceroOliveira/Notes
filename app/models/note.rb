class Note
  include Mongoid::Document
  field :text, :type => String
  field :color, :type => Symbol
  include Mongoid::Timestamps
  
  COLORS = [:yellow, :green, :pink]
  
  validates :color, :inclusion => {:in => COLORS}
  validates :text, :presence => true
  
  embedded_in :stack
end
