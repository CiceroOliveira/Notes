class Note
  include Mongoid::Document
  field :text, :type => String
  field :color, :type => Symbol
  field :owner, :type => String
  include Mongoid::Timestamps
  
  COLORS = [:yellow, :green, :pink]
  
  validates :color, :inclusion => {:in => COLORS}
  validates :text, :owner, :presence => true
end
