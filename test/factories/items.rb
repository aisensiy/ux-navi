# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item do
    sequence(:name) { |n| "link #{n}"}
    sequence(:url)  { |n| "http://www.linke#{n}.com/" }
    description "This is the desc."
  end
end
