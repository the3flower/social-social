FactoryBot.define do
    factory :user do
      name { "Bill Billy" }
      email { "bill@example.com" }
      password { "password@1234" }
      password_confirmation { "password@1234" }
    end
  end