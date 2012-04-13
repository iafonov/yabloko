When /^I install "([^"]*)" package$/ do |package_name|
  execute "test command" do
    command "echo 0"
  end
end