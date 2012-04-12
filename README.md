## Yabloko

BDD tool for infrastructure setup.

Use plain english to setup, maintain and describe your infrastructure setup

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
```gherkin

*(Prototype project)*