#aws instance assigned to subnet a

resource "aws_instance" "instance-a" {
  ami               = "ami-0277155c3f0ab2930"
  instance_type     = "t2.micro"
  tags              = {Name = "Instance-Subnet-a"}
  security_groups   = var.security-group-id
  subnet_id = var.public-subnet-id[0]
  key_name          = "Syst35144-key"
  availability_zone = "us-east-1a"
  user_data         = <<-EOF
          #!/bin/bash
          yum install httpd -y
          systemctl restart httpd
          systemctl enable httpd
          sudo yum install docker -y
          sudo systemctl restart docker
          sudo systemctl enable docker
          sudo docker run -d -p 8080:80 --name nginx_container_8080 nginx
          docker run -d -p 8081:80 --name nginx_container_8081 nginx
          cd /var/www/html
          echo "<html><body><h1> Eric Gentile lab 2 $(hostname -f) </h1></body></html>" > index.html
          EOF  
}

#aws instance assigned to subnet b

resource "aws_instance" "instance-b" {
  ami               = "ami-0277155c3f0ab2930"
  instance_type     = "t2.micro"
  tags              = {Name = "Instance-Subnet-b"}
  security_groups   = var.security-group-id
  subnet_id = var.public-subnet-id[1]
  key_name          = "Syst35144-key"
  availability_zone = "us-east-1b"
  user_data         = <<-EOF
          #!/bin/bash
          yum install httpd -y
          systemctl restart httpd
          systemctl enable httpd
          sudo yum install docker -y
          sudo systemctl restart docker
          sudo systemctl enable docker
          sudo docker run -d -p 8080:80 --name nginx_container_8080 nginx
          docker run -d -p 8081:80 --name nginx_container_8081 nginx
          cd /var/www/html
          echo "<html><body><h1> Eric Gentile lab 2 $(hostname -f) </h1></body></html>" > index.html
          EOF  
}

#aws instance assigned to subnet c

resource "aws_instance" "instance-c" {
  ami               = "ami-0277155c3f0ab2930"
  instance_type     = "t2.micro"
  tags              = {Name = "Instance-Subnet-c"}
  security_groups   = var.security-group-id
  subnet_id = var.public-subnet-id[2]
  key_name          = "Syst35144-key"
  availability_zone = "us-east-1c"
  user_data         = <<-EOF
          #!/bin/bash
          yum install httpd -y
          systemctl restart httpd
          systemctl enable httpd
          sudo yum install docker -y
          sudo systemctl restart docker
          sudo systemctl enable docker
          sudo docker run -d -p 8080:80 --name nginx_container_8080 nginx
          docker run -d -p 8081:80 --name nginx_container_8081 nginx
          cd /var/www/html
          echo "<html><body><h1> Eric Gentile lab 2 $(hostname -f) </h1></body></html>" > index.html
          EOF  
}

#aws instance assigned to subnet d

resource "aws_instance" "instance-d" {
  ami               = "ami-0277155c3f0ab2930"
  instance_type     = "t2.micro"
  tags              = {Name = "Instance-Subnet-d"}
  security_groups   = var.security-group-id
  subnet_id = var.public-subnet-id[3]
  key_name          = "Syst35144-key"
  availability_zone = "us-east-1d"
  user_data         = <<-EOF
          #!/bin/bash
          sudo yum install httpd -y
          sudo systemctl restart httpd
          sudo systemctl enable httpd
          sudo yum install docker -y
          sudo systemctl restart docker
          sudo systemctl enable docker
          sudo docker run -d -p 8080:80 --name nginx_container_8080 nginx
          docker run -d -p 8081:80 --name nginx_container_8081 nginx
          cd /var/www/html
          echo "<html><body><h1> Eric Gentile lab 2 $(hostname -f) </h1></body></html>" > index.html
          EOF  
}

output "instance-ids" {
    value = [aws_instance.instance-a.id, aws_instance.instance-b.id, aws_instance.instance-c.id, aws_instance.instance-d.id]
}