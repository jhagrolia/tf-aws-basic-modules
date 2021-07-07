variable "vpc_name" {
    type = string
    description = "Name of VPC"
    default = "VPC-1"
}

variable "enable_dns_hostnames" {
    type = bool
    description = "Weather to Enable DNS Hostname"
    default = true
}

variable "cidrs" {
    type = object({
        vpc = string
        public_sn = string
        private_sn = string
    })
    description = "CIDR Details"
    default = {
        vpc = "172.17.0.0/16"
        public_sn = "172.17.1.0/24"
        private_sn = "172.17.2.0/24"

    }
}
