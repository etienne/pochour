Factory.sequence :email do |n|
  "roger#{n}@example.com"
end

Factory.define :user do |u|
  u.name 'Steve Fields'
  u.email { Factory.next(:email) }
  u.password 'fieldsfields'
  u.admin false
end

Factory.define :admin, :class => User do |a|
  a.name 'Jésus'
  a.email { Factory.next(:email) }
  a.password 'jesusjesus'
  a.admin true
end

Factory.define :article do |a|
  a.title "Trop malade ton titre"
  a.article "Fucké raide là"
  a.association :user
end