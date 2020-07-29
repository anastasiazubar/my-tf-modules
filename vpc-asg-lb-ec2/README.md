# Task

- Create an Infrastructure in AWS 
- Acceptance Criteria:     
    - EC2 instance through terraform with IAM roles and all necessary resources (security groups, subnets, etc)   
    - User data script that will stand up a httpd server that says "hello world" at root route    
    - bonus: create auto scaling group with EC2  
    - bonus: set up EC2 where public IP is not exposed  


## Prerequsites: 

- Terraform server (with access to AWS Account)
    - Access should have the following permissions
        - Create/Edit EC2 
        - Create/Edit Load Balancer
        - Create/Edit Auto-Scaling
        - Create/Edit VP
        - Existing key-pair and image

## Solution 

- Step 1: Configuring Terraform Server 

    - Install/Configure Terraform (version 12.~) 
    - Make sure Terraform can access AWS Account and has the ability to create above mentioned resources


- Step 2: Write Terraform code 

- Step 3: Run Terrform code 

    - Terraform init
    - Terraform validate
    - Terraform plan
    - Terraform apply

## Resources created with the code

1. VPC
    - public and private subnets
    - internet gateway = cidr (0.0.0.0/0)
    - nat gateway      = cidr (0.0.0.0/0)
    - public route-table = public subnet and internet gateway attached
    - private route-table = private subnet and nat gateway attached
    - eip = for nat gateway
    - security group = for Load balancer and Auto-scaling (port80)

2. Auto-Scaling
    - Launch Configuration = bootstraps the userdata.sh
    - Auto-Scaling group   

3. Load-Balancer
    - Using the Application Load Balancer type
    - Targeting auto scaling group
    - Default action type is forward
    - LB listener is in port 80 and protocol HTTP
4. EC2
    - Security Group (all the necessary ports are open)
    - Apache is installed (ready to serve index.html)