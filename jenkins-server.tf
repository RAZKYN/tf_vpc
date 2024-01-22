
resource "aws_instance" "myapp-server" {
  count                       = var.webserver_info.count
  ami                         = data.aws_ami.latest-amazon-linux-image.id
  instance_type               = var.webserver_info.instance_type
  key_name                    = "jenkins-server"
  subnet_id                   = data.aws_subnets.web_subnet.ids[count.index]
  availability_zone           = "var.az_zones"
  vpc_security_group_ids      = [ aws_default_security_group.default-sg.id ]
  associate_public_ip_address = true
  user_data                   = file("jenkins-server-script.sh")

  tags                        = {
    Name                      = format("%s-%d", var.webserver_info.name, count.index)
  }
}