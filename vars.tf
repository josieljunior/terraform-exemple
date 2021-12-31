variable "ami" {
  type = map

  default = {
      br-ubuntu-server = "ami-090006f29ecb2d79a" # 20.04 LTS
      us-amazon-linux = "ami-0ed9277fb7eb570c9"  # 2 AMI (HVM) - Kernel 5.10
  }
}

variable "cidir_remote_access" {
  type = list
  
  default = [
    "192.141.197.190/32"
  ]
}
