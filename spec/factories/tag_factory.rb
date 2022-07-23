FactoryBot.define do
  factory :tag, class: "Tag" do
    active { true }
    user_id { user_id }
    label { "Label_#{identity}" }
    identity { SecureRandom.hex[0..7] }
  end
end
