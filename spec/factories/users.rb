FactoryBot.define do
  factory :user do
    id { 1 }
    name { 'MeMe' }
    email { 'meme@sample.com' }
    password { 'GGGGGG' }
    admin { false }
  end
  factory :admin_user, class: User do
    id { 2 }
    name { 'Admin' }
    email { 'monadministrateur@gmail.com' }
    password { 'madmin1' }
    admin { true }
  end
end
