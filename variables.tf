variable "instance_type" {
  description = "The type of EC2 instance used to create the instance."
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "The ID of the AMI"
  type        = string
  default     = "ami-00beae93a2d981137"
}