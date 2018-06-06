## This repository illustrates how terraform configuration can be used to create resources using AWS and Docker as provider.

## Managing Wordpress with Terraform

Terraform file `docker_wordpress.tf` is configured to create 2 docker containers, one running mySQL and other to run Wordpress. Both the containers are configured to run in same network. 

## Managing resources in AWS with Terraform

Terraform file `ec2.tf` is configured to create an EC2 instance and an Elastic Load Balancer

## CMDs to run the Terraform file

terraform init
terraform plan
terraform apply


