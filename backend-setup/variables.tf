variable "region" {
  default     = "us-east-1"
}

variable "bucket_name" {
  default     = "suleman-terraform-remote-state-12"
}

variable "lock_table" {
  default     = "terraform-locks"
}

variable "environment" {
  default     = "dev"
}