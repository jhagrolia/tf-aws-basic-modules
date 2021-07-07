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
    default = []
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
