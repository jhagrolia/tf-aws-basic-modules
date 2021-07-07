variable "vpc_id" {
    type = string
    description = "VPC ID"
    default = null
}

variable "rds_port" {
    type = number
    description = "Port of RDS"
    default = 3306
}

variable "rds_allow_cidr" {
    type = list(string)
    description = "CIDR on which to allow RDS Connectivity"
    default = []
}

variable "engine" {
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

variable "db_identifier" {
    type = string
    description = "RDS Database Identifier"
    default = "mysql-db"
}

variable "db_cred" {
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

variable "db_inst_class" {
    type = string
    description = "Instance Class of RDS Database"
    default = "db.t2.micro"
}

variable "db_storage" {
    type = object({
        class = string
        size = number
    })
    description = "RDS Database Credentials"
    default = {
        class = "gp2"
        size = 20
    }
}

variable "public_rds" {
    type = bool
    description = "Make RDS Public"
    default = false
}

variable "db_name" {
    type = string
    description = "Database Name"
    default = "newdb"
}

variable "upgrade" {
    type = object({
        auto_minor = bool
        allow_major = bool
    })
    description = "RDS Database Credentials"
    default = {
        auto_minor = true
        allow_major = true
    }
}

variable "rds_del_protection" {
    type = bool
    description = "Enable/Disable Deletion Protection for RDS"
    default = false
}

variable "subnets" {
    type = list(string)
    description = "List of subnets for RDS Subnet Group"
    default = null
}

variable "final_snapshot" {
    type = object({
        skip = bool
        identifier = string
    })
    description = "RDS Database Credentials"
    default = {
        skip = false
        identifier = "final-snapshot-mysql-db"
    }
}
