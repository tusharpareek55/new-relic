resource "newrelic_alert_policy" "firstAlertP" {
  name = "my-alert"
}

resource "newrelic_nrql_alert_condition" "firstAlert" {

  count = length(var.condition)

  account_id                     = var.condition[count.index].account_id
  policy_id                      = newrelic_alert_policy.firstAlertP.id
  type                           = var.condition[count.index].type
  name                           = var.condition[count.index].name
  description                    = var.condition[count.index].description
  runbook_url                    = var.condition[count.index].runbook_url
  enabled                        = var.condition[count.index].enabled
  violation_time_limit_seconds   = var.condition[count.index].violation_time_limit_seconds
  fill_option                    = var.condition[count.index].fill_option
  fill_value                     = var.condition[count.index].fill_value
  aggregation_window             = var.condition[count.index].aggregation_window
  aggregation_method             = var.condition[count.index].aggregation_method
  aggregation_delay              = var.condition[count.index].aggregation_delay
  expiration_duration            = var.condition[count.index].expiration_duration
  open_violation_on_expiration   = var.condition[count.index].open_violation_on_expiration
  close_violations_on_expiration = var.condition[count.index].close_violations_on_expiration
  slide_by                       = var.condition[count.index].slide_by
  baseline_direction             = var.condition[count.index].baseline_direction


  nrql {
    query = var.condition[count.index].query
  }

  critical {
    operator              = var.condition[count.index].operator
    threshold             = var.condition[count.index].threshold
    threshold_duration    = var.condition[count.index].threshold_duration
    threshold_occurrences = var.condition[count.index].threshold_occurrences
  }

  warning {
    operator              = var.condition[count.index].operator
    threshold             = var.condition[count.index].threshold
    threshold_duration    = var.condition[count.index].threshold_duration
    threshold_occurrences = var.condition[count.index].threshold_occurrences
  }
}