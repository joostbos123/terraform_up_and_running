resource "aws_instance" "example" {
  ami           = "ami-070b208e993b59cea"
  instance_type = "t2.micro"

  user_data = <<-EOF
                #!/bin/bash
                echo "Hello, World" > index.html
                nohup busybox http -f -p 8080 &
                EOF

  user_data_replace_on_change = true

  tags = {
    Name = "terraform-example"
  }
}
