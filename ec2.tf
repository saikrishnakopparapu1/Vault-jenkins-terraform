resource "aws_instance" "vault" {
  ami           = "ami-045443a70fafb8bbc" # Amazon Linux
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public.id
  key_name      = var.key_name

  vpc_security_group_ids = [aws_security_group.vault_sg.id]

  user_data = file("userdata/vault.sh")

  tags = {
    Name = "vault-server"
  }
}