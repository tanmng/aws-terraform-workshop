provider "aws" {
  region = "us-west-1"
}

resource "aws_instance" "example" {
  ami           = "ami-65e0e305"
  instance_type = "t2.micro"

  tags {
    Name = "terraform-example-2"

    //ELB  = "${aws_elb.example.id}"
  }
}

resource "aws_elb" "example" {
  name               = "example"
  availability_zones = ["us-west-1a", "us-west-1b"]
  instances          = ["${aws_instance.example.id}"]

  listener {
    lb_port           = 80
    lb_protocol       = "http"
    instance_port     = "${var.instance_port}"
    instance_protocol = "http"
  }
}
