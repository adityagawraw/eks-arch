resource "aws_launch_template" "eks_launch_templete" {
  name = "eks_launch_templete-2"

  image_id = "ami-0bb84b8ffd87024d8"

  block_device_mappings {
    device_name = "/dev/sdf"

    ebs {
      volume_size = 10
      volume_type = "gp3"
      encrypted = true
    }
  }

  instance_type = "t2.medium"

  monitoring {
    enabled = true
  }

  network_interfaces {
    associate_public_ip_address = false
    security_groups             = [aws_security_group.eks_node_group_sg.id]
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "eks-node"
    }
  }
}