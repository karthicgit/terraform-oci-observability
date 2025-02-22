#Copyright (c) 2023 Oracle Corporation and/or its affiliates.
#Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

variable "compartment_ocid" {
  description = "Compartment OCID"
  type        = string
}


variable "alarm_def" {
  description = "OCI Alarm definition"
  type = map(object({
    destination                  = string
    display_name                 = string
    severity                     = optional(string, "CRITICAL")
    query                        = string
    is_enabled                   = optional(bool, true)
    namespace                    = string
    metric_compartment_id        = optional(string)
    metric_compartment_id_in_subtree = optional(bool,false)
    repeat_notification_duration = optional(string)
    trigger                      = optional(string, "PT1M")
    suppression_from_time        = optional(string)
    suppression_till_time        = optional(string)
    suppression_description = optional(string)
    message_format               = optional(string, "RAW")
    body                         = optional(string, null)
    freeform_tags                = optional(map(string))
    defined_tags                 = optional(map(string))
    resolution                   = optional(string, "1m")
    resource_group               = optional(string, null)
    split_notification           = optional(bool, false)
    notification_title = optional(string)
    notification_version = optional(string)
    evaluation_slack_duration = optional(string,"PT3M")
    
    overrides = optional(map(object({
      body             = string
      pending_duration = string
      query            = string
      rule_name        = string
      severity         = string
    })))
  }))
}

variable "notification" {
  description = "Notification Topic and Subscription"
  type = map(object({
    description   = optional(string)
    create_topic  = optional(bool, true)
    defined_tags  = optional(map(string))
    freeform_tags = optional(map(string))
    subscription = optional(map(object({
      endpoint = string
      protocol = string
    })))
  }))
}

variable "label_prefix" {
  default     = "none"
  description = "Prefix to be added to the resources"
  type        = string
}
