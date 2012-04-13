## Yabloko

BDD tool for infrastructure setup.

Use plain english to setup, maintain and document your infrastructure setup

```gherkin
Feature: Application server

  Scenario: Adding user for deployment
    When I add group "deployment"
     And I add user "deploy" to "deployment" group
    Then I should be able to switch to "deploy" user

  Scenario: Apache setup
    When I install "apache" package
     And I disable the default site
     And I put "application.conf" to sites-available folder
     And I enable "application" site
     And I reload apache service
    Then apache should be running
     And application should be available on "/"
```

Under the hood yabloko uses [chef](http://www.opscode.com/chef/) - you can call resources from step definitions in the same way they are used in traditional recipes. The full list of available resources is available on the [corresponding chef wiki page](http://wiki.opscode.com/display/chef/Resources). 

Examples of steps:

```ruby
When /^I install "([^"]*)" package$/ do |package_name|
  package package_name do
    action :install
  end
end

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

*(Prototype project)*
© 2012 [Igor Afonov](http://iafonov.github.com)