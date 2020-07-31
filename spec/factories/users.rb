FactoryBot.define do
  factory :user do
    email    { FFaker::Internet.email }
    password { FFaker::Internet.password }
    question_1 { '' }
    question_2 { '' }
    question_3 { '' }
    question_4 { '' }
    question_5 { '' }
  end
end

