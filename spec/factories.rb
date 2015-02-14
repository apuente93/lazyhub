FactoryGirl.define do
  factory :user do
    sequence(:username)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end

  factory :article do
    user
    content "Lorem ipsum"
    article_type "Laugh"
  end

  factory :comment do
    user
    article
    content "Lorem ipsum"
  end
end