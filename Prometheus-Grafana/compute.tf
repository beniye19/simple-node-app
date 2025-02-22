# Define data source to fetch the latest Ubuntu AMI for Ubuntu 24.04 from AWS
data "aws_ami" "server_ami" {
  most_recent = true

  owners = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

# AWS instance for Grafana
resource "aws_instance" "Grafana" {
  ami                    = data.aws_ami.server_ami.id
  instance_type          = var.grafana_instance
  vpc_security_group_ids = [aws_security_group.grafana_sg.id]

  #User Data in AWS EC2
  user_data = file("grafana install.sh")

  tags = {
    Name = "Grafana"
  }
}

# AWS instance for Prometheus
resource "aws_instance" "Prometheus" {
  ami                    = data.aws_ami.server_ami.id
  instance_type          = var.prometheus_instance
  vpc_security_group_ids = [aws_security_group.prometheus_sg.id]


  tags = {
    Name = "Prometheus"
  }
}

resource "aws_instance" "Node_Exporter" {
  ami                    = data.aws_ami.server_ami.id
  instance_type          = var.node_exporter_instance
  vpc_security_group_ids = [aws_security_group.node_exporter_sg.id]

  user_data = <<-EOF
    ${file("apache install.sh")}
    ${file("install_jenkins.sh")}
  EOF

  tags = {
    Name = "Node Exporter"
  }
}
