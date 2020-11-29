resource "aws_instance" "k8s_master" {
  ami           = "ami-0eeb679d57500a06c" //ubuntu 18.04 LTS 64bit x86
  instance_type = "t2.micro"
  
  subnet_id              = aws_subnet.public1.id
  vpc_security_group_ids = [aws_security_group.k8s_master.id]

  key_name               = aws_key_pair.local_key.key_name
}

resource "aws_instance" "k8s_worker" {
  ami           = "ami-0eeb679d57500a06c" //ubuntu 18.04 LTS 64bit x86
  instance_type = "t2.micro"

  subnet_id              = aws_subnet.public1.id
  vpc_security_group_ids = [aws_security_group.k8s_worker.id]

  key_name               = aws_key_pair.local_key.key_name
}

resource "aws_eip" "master_eip" {
  instance = aws_instance.k8s_master.id
  vpc      = true
}

resource "aws_eip" "worker_eip" {
  instance = aws_instance.k8s_worker.id
  vpc      = true
}

resource "aws_key_pair" "local_key" {
  key_name   = "local-key"
  public_key = file(var.pub_key_path)
}
