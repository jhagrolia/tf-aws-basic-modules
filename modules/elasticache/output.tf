// Elasticache Cluster Address output 
output "cache_cluster_address" {
    value = aws_elasticache_cluster.cache_cluster.cluster_address
}
