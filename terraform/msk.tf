
resource "aws_msk_cluster" "capstone_msk_cluster" {
  cluster_name           = "Capstone"
  kafka_version          = "3.5.1"
  number_of_broker_nodes = 2
  broker_node_group_info {
    instance_type = "kafka.t3.small"
    client_subnets = [
      aws_subnet.private_subnet_1a.id,
      aws_subnet.private_subnet_1b.id
    ]
    security_groups = [aws_security_group.MSK_security.id]
    storage_info {
      ebs_storage_info {
        volume_size = 100
      }
    }
  }
  encryption_info {
    encryption_in_transit {
      client_broker = "PLAINTEXT"
    }
  }
  client_authentication{
    unauthenticated = true
  }
}

output "bootstrap_brokers" {
  value       = aws_msk_cluster.capstone_msk_cluster.bootstrap_brokers
  description = "Comma separated list of one or more hostname:port pairs of Kafka brokers suitable to bootstrap connectivity to the Kafka cluster"
}

