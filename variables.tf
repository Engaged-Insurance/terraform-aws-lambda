variable "aws_region" {
  type    = string
}

# Lambda

variable "runtime" {
  type = string
}

variable "function_name" {
  type = string
}

variable "handler" {
  type    = string
  default = "index.handler"
}

variable "env_vars" {
  type    = map(string)
  default = {}
}

variable "timeout" {
  type = number
}


# API Gateway

variable "route_key" {
  type    = string
  default = "$default"
}

variable "allow_origins" {
  type    = list(string)
  default = ["*"]
}

variable "allow_methods" {
  type    = list(string)
  default = ["*"]
}
