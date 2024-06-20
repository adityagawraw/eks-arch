variable "aws_region"{
    type=string
}

variable "igw_name"{
    type=string
}
variable "aws_vpc_nat_tags" {
  type = object({
    Name = string
  })
}

variable "aws_eip_tags" {
type = object({
  Name = string
})  
}

variable "vpc_name"{
    type=string
    default="cluster-vpc-demo"
}

variable "aws_s3_bucket_name"{
    type=string
    default="bucket-cluster-b1"
}

variable "cluster_name" {
  type = string
  default = "demo-1"
}

variable "vpc_cidr_block" {
  type = string
  default = "192.168.0.0/16"
}

variable "subnet_cidr_block" {
  type = list(string)
  default = ["192.168.0.0/18", "192.168.64.0/18", "192.168.128.0/18", "192.168.192.0/18"]
}

variable "availability_zone_private" {
  type = list(string)
  default = ["us-east-1a", "us-east-1b"]
}

variable "availability_zone_public" {
  type = list(string)
  default = ["us-east-1a", "us-east-1b"]
}