class Stack
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, :type => String
  
  validates :name, :user_id, :presence => true
  
  embeds_many :notes
  
  referenced_in :user
end
