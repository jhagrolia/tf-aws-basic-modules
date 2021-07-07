// Output of Database Host address 
output "db_host" {
    value = aws_db_instance.rds_db.address
}
