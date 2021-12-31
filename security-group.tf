/*
*   Security group in Brazil
*/
resource "aws_security_group" "access-ssh-br" {
  provider = aws.br
  name        = "access-ssh"
  description = "Allow access ssh"

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = var.cidir_remote_access
  }
  tags = {
    Name = "ssh"
  }
}

/*
*   Security group in US
*/
resource "aws_security_group" "access-ssh-us" {
  provider = aws.us
  name        = "access-ssh"
  description = "Allow access ssh"

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["192.141.197.190/32"]
  }
  tags = {
    Name = "ssh"
  }
}