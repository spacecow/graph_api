FactoryGirl.define do
  factory :universe do
    sequence(:title){|n| "title#{n}"}
  end
end
