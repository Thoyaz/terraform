variable "instances" {
  type    = list(any)
  default = ["mongodb", "mysql", "catalogue", "redis", "rabbitmq", "user", "cart", "shipping", "payment", "frontend"]
}


variable "ami_id" {
  type        = string
  default     = "ami-0220d79f3f480ecf5"
  description = "RHEL 9 Image"
}

variable "sg_name" {
  type    = string
  default = "From Variables.tf file"
}


variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "instance_tags" {
  type = map(any)
  default = {
    Name      = "Test Server"
    Terraform = true
    Test      = "worked"
  }
}

variable "sg_egress_from_port" {
  type    = number
  default = 0
}

variable "sg_egress_to_port" {
  type    = number
  default = 0
}

variable "sg_egress_cidr" {
  type    = list(any)
  default = ["0.0.0.0/0"]
}


variable "sg_ingress_from_port" {
  type    = number
  default = 0
}

variable "sg_ingress_to_port" {
  type    = number
  default = 0
}

variable "sg_ingress_cidr" {
  type    = list(any)
  default = ["0.0.0.0/0"]
}

variable "sg_tags" {
  type = map(any)
  default = {
    Name      = "testserver01"
    terraform = true
  }
}