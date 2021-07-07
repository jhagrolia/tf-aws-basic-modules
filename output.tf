// Output of RDS Database Host address 
output "rds_host" {
    value = module.rds_module.db_host
}

// Elasticache Cluster Address output 
output "elasticache_cluster_address" {
    value = module.elasticache_module.cache_cluster_address
}

