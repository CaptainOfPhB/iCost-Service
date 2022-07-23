FactoryBot.define do
  factory :user, class: "User" do
    role { :USER }
    visible { true }
    email { "example@email.com" }
    nick_name { "User_#{identity}" }
    identity { SecureRandom.hex[0..7] }
  end
end
