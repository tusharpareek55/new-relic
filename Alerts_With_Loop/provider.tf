terraform {

  required_providers {

    newrelic = {

      source = "newrelic/newrelic"

      version = "3.26.0"

    }

  }

}

provider "newrelic" {

  account_id = 4048566
  region = "US"  

}