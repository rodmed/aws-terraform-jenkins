provider "aws" {
  region  = var.AWS_REGION
  version = "~> 2.31.0"
}

resource "aws_key_pair" "mykeypair" {
  key_name   = "mykeypair"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "jenkins-master" {
  ami           = "ami-09d933ac2cc113652" #TODO: tornar dinamico
  instance_type = var.INSTANCE_TYPE_MASTER
  subnet_id     = "subnet-a8e5fcc0" #TODO: tornar dinamico

  #Default Security Group permitindo sh 
  #vpc_security_group_ids = [aws_security_group.allow-ssh.id]

  key_name  = aws_key_pair.mykeypair.key_name #TODO: tornar configuravel
  user_data = <<EOF
                echo 'hello'
                EOF

  tags = {
    Name        = "jenkins-master"
    Environment = "dev"
    Author      = "rodmed1985@gmail.com"
  }
}

resource "aws_ebs_volume" "ebs-jenkins-master-vol-1" {
  availability_zone = "us-east-2a"
  size              = 20
  type              = "gp2"
  tags = {
    Name = "extra volume data"
  }
}

resource "aws_volume_attachment" "ebs-jenkins-master-vol-1-attachment" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.ebs-jenkins-master-vol-1.id
  instance_id = aws_instance.jenkins-master.id
}
