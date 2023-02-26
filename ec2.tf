resource "tls_private_key" "private_key_type" {
	  algorithm = "RSA"
	  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
	  depends_on = [
	    tls_private_key.private_key_type
	  ]
	  key_name   = "${var.key_name}"
	  public_key = "${tls_private_key.private_key_type.public_key_openssh}"
}

resource "aws_instance" "terraforminstance" {
  ami                         = var.ami_id
  availability_zone           = var.availability_zone
  instance_type               = var.instance_type
  key_name                    = var.key_name
  security_groups             = ["${aws_security_group.ec2-sg.id}"]
  subnet_id                   = var.subnet_id

  connection {
    type = "ssh"
    user = "ec2-user"
    private_key = tls_private_key.private_key_type.private_key_pem
    host = aws_instance.terraforminstance.public_ip
  }

  provisioner "remote-exec" {
	    inline = [
	      "sudo yum install httpd git -y",
	      "sudo systemctl restart httpd",
	      "sudo systemctl enable httpd",
        "sudo rm -rf /var/www/html/*",
        "sudo git clone -branch develop https://github.com/melio-consulting/infra-problem /var/www/html/",
        "sudo systemctl start httpd"
	    ]
	  }

  associate_public_ip_address = true
  ebs_block_device {
    device_name           = "/dev/xvda"
    volume_size           = 8
    volume_type           = "gp2"
    delete_on_termination = true
    tags = {
      Name = "terraform-storage"
    }
  }
  tags = var.tags
}