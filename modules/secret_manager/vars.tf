variable init {
  description = "The initiative of the engagement. Added to the labels."
  type        = string
  default     = "podrec"
}

#Required
variable project_id {
  description = "The id of the project where the secrets need to be deployed"
  type        = string
}

#Required
variable secret_id {
  description = "The id/name of the secret to be created"
  type        = string
}

#Required
variable secret_data {
  description = "The data to be stored as a secret under the first version"
  type        = string
}