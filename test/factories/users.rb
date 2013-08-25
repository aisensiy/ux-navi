# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password "0000000a"
    password_confirmation "0000000a"
    # avatar do
    #   fixture_file_upload(Rails.root.join("public/images/sample-user.png"), "image/png")
    # end
    factory :admin do
      is_admin true
    end
  end
end
