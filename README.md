## Yabloko

BDD tool for infrastructure setup.

Use plain english to setup, maintain and document your infrastructure setup

```gherkin
Feature: Application server

  Scenario: Adding a user for deployment
    When I add group "deployment"
     And I add user "deploy" to "deployment" group
    Then I should be able to switch to "deploy" user
```

Under the hood yabloko uses [chef](http://www.opscode.com/chef/) - you can call resources from step definitions in the same way they are used in traditional recipes. The full list of available resources is available on the [corresponding chef wiki page](http://wiki.opscode.com/display/chef/Resources). 

Examples of steps:

```ruby
When /^I add group "([^"]*)"$/ do |group_name|
  group group_name
end

When /^I add user "([^"]*)" to "([^"]*)" group$/ do |user_name, group_name|
  user user_name do
    gid group_name
    supports :manage_home => true
  end
end
```

All magic happens [here](https://github.com/iafonov/yabloko/blob/master/lib/yabloko/chef_helper.rb).

*(Prototype project)*
© 2012 [Igor Afonov](http://iafonov.github.com)