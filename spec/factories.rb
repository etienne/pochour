Factory.sequence :name do |n|
  "Steve Fields #{n}"
end

Factory.sequence :email do |n|
  "roger#{n}@example.com"
end

Factory.define :user do |u|
  u.name { Factory.next(:name) }
  u.email { Factory.next(:email) }
  u.password 'fieldsfields'
  u.admin false
end

Factory.define :admin, :class => User do |a|
  a.name { Factory.next(:name) }
  a.email { Factory.next(:email) }
  a.password 'jesusjesus'
  a.admin true
end

Factory.define :article do |a|
  a.title "Trop malade ton titre"
  a.article "Fucké raide là"
  a.association :user
end

Factory.define :comment do |c|
  c.comment "Some random comment"
end

Factory.define :epithet do |e|
  e.name "fucked up"
  e.approved true
end