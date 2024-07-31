provider "aws" {
  region = "us-east-1"

}
variable "keyname" {

 type = string

}

resource "tls_private_key" "rsa24" {

algorithm = "RSA"

rsa_bits = 4096

}

resource "aws_key_pair" "tf-key-pair24" {

key_name = var.keyname

public_key = tls_private_key.rsa.public_key_openssh

}

resource "local_file" "tf-key24" {

content = tls_private_key.rsa.private_key_pem

filename = var.keyname

}
