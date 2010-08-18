Factory.define :user do |u|
  u.name 'Steve Fields'
  u.email 'steve@fields.com'
  u.password 'fieldsfields'
  u.admin false
end

Factory.define :admin, :class => User do |a|
  a.name 'Jésus'
  a.email 'jesus@voujvou.com'
  a.password 'jesusjesus'
  a.admin true
end

Factory.define :article do |a|
  a.title "Trop malade ton titre"
  a.article "Fucké raide là"
end