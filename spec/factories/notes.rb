# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :note do
      text "Yellow Note"
      color "yellow"
      owner "Cicero"
    end
end