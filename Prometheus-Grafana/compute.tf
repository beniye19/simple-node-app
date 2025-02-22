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