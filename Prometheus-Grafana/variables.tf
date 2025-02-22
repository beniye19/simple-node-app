# Variable for AWS region
variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

# Variable for instance type of Grafana
variable "grafana_instance" {
  description = "Instance type for Grafana"
  type        = string
  default     = "t2.micro"
}

# Variable for VPC ID
variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
  default     = "vpc-03ec2d2921cf9b819"
}

# Variable for security group name of Grafana
variable "security_group_name" {
  description = "Grafana security group name"
  type        = string
  default     = "grafana-security-group"
}

# Variable for instance type of Prometheus
variable "prometheus_instance" {
  description = "Instance type for Prometheus"
  type        = string
  default     = "t2.micro"
}

# Variable for security group name of Prometheus
variable "prom_security_group_name" {
  description = "Prometheus security group name"
  type        = string
  default     = "prometheus-security-group"
}

# Variable for instance type of Node Exporter
variable "node_exporter_instance" {
  description = "Instance type for Node Exporter"
  type        = string
  default     = "t3.xlarge"
}

# Variable for security group name of Node Exporter
variable "node_exporter_security_group_name" {
  description = "Prometheus security group name"
  type        = string
  default     = "node-exporter-security-group"
}