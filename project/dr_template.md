# Infrastructure

## AWS Zones
"us-east-2a","us-east-2b"

## Servers and Clusters

### Table 1.1 Summary
| Asset      | Purpose           | Size                                                                   | Qty                                                             | DR                                                                                                           |
|------------|-------------------|------------------------------------------------------------------------|-----------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------|
| Asset name | Brief description | AWS size eg. t3.micro (if applicable, not all assets will have a size) | Number of nodes/replicas or just how many of a particular asset | Identify if this asset is deployed to DR, replicated, created in multiple locations or just stored elsewhere |
| EC2 Instance | Virtual Machine | t3.micro | 3 | 2 availability zones |
| Load Balancer | Application LB | NA | 1 | Targets under different availability zones |
| EKS | Kubernetes Cluster | NA | 2 | Nodes under different availability zones |
| RDS Cluster | Database Cluster | db.t3.medium | 2| instances under different availability zones, Deployed to DR, available in multiple regions, replication enabled |


### Descriptions
More detailed descriptions of each asset identified above.

## DR Plan
### Pre-Steps:
List steps you would perform to setup the infrastructure in the other region. It doesn't have to be super detailed, but high-level should suffice.

1. Ensure that the DR infrastructure is setup with exact same configuration and accross multiple regions

## Steps:
You won't actually perform these steps, but write out what you would do to "fail-over" your application and database cluster to the other region. Think about all the pieces that were setup and how you would use those in the other region

1. An application Load balancer is available which has 3 EC2 instances as the targets. A DNS needs to be pointed to the Load balancer to abstract each individual EC2 instance. During a failover scenario, the DNS entry can be pointed to the DR load balancer and traffic would be routed without too much delay and hassle.
2. The RDS clusters (primary and secondary) should have active replication on. In failover scenario, the primary cluster will be brought down which will mark the secondary cluster in different region as Regional(primary) automatically without any loss of time and real time data.