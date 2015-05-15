FactoryGirl.define do
  factory :universe do
    sequence(:title){|n| "title#{n}"}
  end

  factory :user do
    password 'foobar'
  end
end
