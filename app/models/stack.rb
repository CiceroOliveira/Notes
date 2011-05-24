class Stack
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, :type => String
  
  validates :name, :presence => true
  
  embeds_many :notes
end
