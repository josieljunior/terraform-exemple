/*
*  Region Sao Paulo - BR
*/ 
provider "aws" {
  alias = "br"
  # version = "~> 2.0"
  region  = "sa-east-1" 
}

/*
*  Region N. Virginia - US
*/ 
provider "aws" {
  alias = "us"  
  # version = "~> 2.0"  
  region  = "us-east-1" 
}

/*
*  Create 3 equal instances
*/ 
# resource "aws_instance" "dev" {
#   provider = aws.br
#   count = 3
#   ami = "${var.ami[br-ubuntu-server]}" 
#   instance_type = "t2.micro"
#   key_name = "terraform"
#   tags = {
#     Name = "dev${count.index}"
#   }
#   vpc_security_group_ids = ["${aws_security_group.access-ssh-br.id}"]
# }

/*
*  Create machine dev4 in Brazil
*/ 
resource "aws_instance" "dev4" {
  provider = aws.br
  ami = var.ami["br-ubuntu-server"]
  instance_type = "t2.micro"
  key_name = "terraform"
  tags = {
    Name = "dev4"
  }
  vpc_security_group_ids = ["${aws_security_group.access-ssh-us.id}"]
  depends_on = [               # link resource and create before instance
    aws_s3_bucket.dev4
  ]
}

/*
*  Create machine dev5 in US
*/ 
resource "aws_instance" "dev5" {
  provider = aws.us
  ami = var.ami["us-amazon-linux"]
  instance_type = "t2.micro"
  key_name = "terraform"
  tags = {
    Name = "dev5"
  }
  vpc_security_group_ids = ["${aws_security_group.access-ssh-us.id}"]
  depends_on = [
      aws_dynamodb_table.dev5
  ]
}