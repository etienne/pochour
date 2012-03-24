# encoding: UTF-8

FactoryGirl.define do
  sequence :name do |n|
    "Steve Fields #{n}"
  end

  sequence :email do |n|
    "roger#{n}@example.com"
  end

  factory :user do
    name
    email
    password 'fieldsfields'
    admin false
  end

  factory :admin, :class => 'user' do
    name
    email
    password 'jesusjesus'
    admin true
  end

  factory :article do
    title "Trop malade ton titre"
    body "Fucké raide là"
    draft false
    user
  end

  factory :comment do
    comment "Some random comment"
  end

  factory :epithet do
    name "fucked up"
    approved true
  end
end

