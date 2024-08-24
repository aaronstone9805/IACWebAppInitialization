resource "aws_instance" "first_ec2_instance" {
  ami       	= "ami-02d3770deb1c746ec"
  instance_type = "t2.micro"
  tags = {
	Name = "My first EC2 instance"
  }
}