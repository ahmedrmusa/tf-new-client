data "aws_ami" "windows" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["Windows_Server-2022-English-Full-Base-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

locals {
  client_vars   = jsondecode(file("./list/${var.client_name}/client.tfvars"))
  ami_id        = data.aws_ami.windows.id
  
  db_name           = "${local.client_vars.client_name}-db"
  allocated_storage = "100"
  engine = "sqlserver-ex"
  engine_version = "14.00.3049.1.v1"
  instance_class = "db.t2.micro"

  ingress_rules = [
    {
      description      = "TLS from VPC"
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      cidr_blocks      = ["10.0.0.0/16"]
      ipv6_cidr_blocks = []
    },
    {
      description      = "application listening on ports"
      from_port        = 7000
      to_port          = 7010
      protocol         = "tcp"
      cidr_blocks      = ["10.0.0.0/16"]
      ipv6_cidr_blocks = []
    }
  ]

  egress_rules = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
  ]
}