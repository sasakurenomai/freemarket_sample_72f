FactoryBot.define do

  factory :user do
    nickname              {"コロナ野郎"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    first_name            {"安倍"}
    last_name             {"晋三"}
    first_name_kana       {"アベ"}
    last_name_kana        {"シンゾウ"}
    birthday              {"2020-04-07"}

  end

end