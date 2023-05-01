resource "aws_docdb_cluster" "docdb" {
  cluster_identifier      = "robot-${var.ENV}-docdb"
  engine                  = "docdb"
  master_username         = "admin1"
  master_password         = "roboshop1"
  skip_final_snapshot     = true
  
}

# Creates Subnet Group Needed to host the docdb cluster 
resource "aws_docdb_subnet_group" "docdb_subnet_group" {
  name       = "robot-${var.ENV}-docdb-subnet-group"
  subnet_ids = data.terraform_remote_state.vpc.outputs.PRIVATE_SUBNET_IDS

  tags = {
    Name = "robot-${var.ENV}-docdb-subnet-group"
  }
}

