Given /^I have the following (.*) records:$/ do |model, table|
  table.hashes.each do |record|
    Factory(model.to_sym, record)
  end
end
