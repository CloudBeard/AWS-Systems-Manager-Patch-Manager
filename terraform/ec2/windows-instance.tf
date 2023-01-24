resource "aws_instance" "windows-demo" {
  ami           = "ami-0c644f818f60ae4f3"
  instance_type = "t2.micro"

  tags = {
    "OS" = "Windows2019"
  }
}
