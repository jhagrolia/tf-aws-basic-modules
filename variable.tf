// --------------------------------- //
// --- Variables for VPC Modules --- //
// --------------------------------- //

variable "vpc_name" {
    type = string
    description = "Name of VPC"
    default = "vpc1"
}

// --------------------------------- //
// --- Variables for RDS Modules --- //
// --------------------------------- //

variable "rds_allow_cidr" {
    type = list(string)
    description = "CIDR on which to allow RDS Connectivity"
    default = ["172.31.0.0/16"]
}

variable "rds_db_cred" {
    type = object({
        user = string
        pass = string
    })
    description = "RDS Database Credentials"
    sensitive = true
    default = {
        user = "master_user"
        pass = "masterdb_userpass"
    }
}

variable "rds_engine" {
    type = object({
        name = string
        version = string
    })
    description = "RDS Engine Configuration"
    default = {
        name = "mysql"
        version = "5.7.21"
    }
}

// --------------------------------- //
// Variables for Elasticache Modules //
// --------------------------------- //

variable "cache_port" {
    type = number
    description = "Elasticache Port"
    default = 11211
}

variable "cache_engine" {
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
