#
# k8s master
#
resource "aws_security_group" "k8s_master" {
  name        = "k8s_master_security_group"
  description = "k8s master port settings"

  vpc_id = aws_vpc.my_vpc.id

  # ssh
  ingress {
    from_port   = var.ssh_port
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.cidr_blocks
  }

  # kube-apiserver
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.cidr_blocks
  }
  
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = var.cidr_blocks
  }

  ingress {
    from_port   = 6443
    to_port     = 6443
    protocol    = "tcp"
    cidr_blocks = var.cidr_blocks
  }
  
  # kube-apiserver, etcd
  ingress {
    from_port   = 2379
    to_port     = 2380
    protocol    = "tcp"
    cidr_blocks = var.cidr_blocks
  }
  
  # Kubelet API
  ingress {
    from_port   = 10250
    to_port     = 10250
    protocol    = "tcp"
    cidr_blocks = var.cidr_blocks
  }
  
  # kube-scheduler
  ingress {
    from_port   = 10251
    to_port     = 10251
    protocol    = "tcp"
    cidr_blocks = var.cidr_blocks
  }

  # kube-controller-manager
  ingress {
    from_port   = 10252
    to_port     = 10252
    protocol    = "tcp"
    cidr_blocks = var.cidr_blocks
  }

  # Arrow outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#
# k8s worker
#

resource "aws_security_group" "k8s_worker" {
  name        = "k8s_worker_security_group"
  description = "k8s worker port settings"

  vpc_id = aws_vpc.my_vpc.id

  # ssh
  ingress {
    from_port   = var.ssh_port
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.cidr_blocks
  }

  # https
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = var.cidr_blocks
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.cidr_blocks
  }

  # Kubelet API
  ingress {
    from_port   = 10250
    to_port     = 10252
    protocol    = "tcp"
    cidr_blocks = var.cidr_blocks
  }

  # NodePort, Service
  ingress {
    from_port   = 30000
    to_port     = 32767
    protocol    = "tcp"
    cidr_blocks = var.cidr_blocks
  }

  # Arrow outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}