data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn-ami-hvm-*-x86_64-gp2",]
  }

  filter {
    name = "owner-alias"

    values = ["amazon",]
  }
}

resource "aws_instance" "example" {
  ami           = data.aws_ami.amazon_linux.id # Replace with your desired AMI ID
  instance_type = var.instance_type             # Replace with your desired instance type

  tags = {
    Name = var.tag_name
  }
}