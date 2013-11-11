# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :movie do
    title "MyString"
    duration 1
    synopsis "SynopisText"
    year 1
    categories "MyCategories"
  end
end