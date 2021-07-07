variable "vpc_id" {
    type = string
    description = "VPC ID"
    default = null
}

variable "port" {
    type = number
    description = "Elasticache Port"
    default = 11211
}

variable "cluster_name" {
    type = string
    description = "Name of Elasticache CLuster"
    default = "cachecluster1"
}

variable "engine" {
    type = object({
        name = string
        version = string
    })
    description = "Elasticache Engine Details"
    default = {
        name = "memcached"
        version = "1.6.6"
    }
}

variable "node_type" {
    type = string
    description = "Elasticache Node Types"
    default = "cache.t2.micro"
}

variable "num_cache_nodes" {
    type = number
    description = "Number of Cache Nodes"
    default = 1
}

variable "parameter_group" {
    type = string
    description = "Parameter Group"
    default = "default.memcached1.6"
}

variable "subnets" {
    type = list(string)
    description = "List of subnets for Elasticache Subnet Group"
    default = null
}
