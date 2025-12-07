resource "local_file" "ansible_inventory" {
  filename = "./inventory"
  content  = join("\n", flatten([
    ["[project]"],
    [for i in aws_instance.project : "${i.public_ip} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/key.pem"]
  ]))
  file_permission      = "0777"
  directory_permission = "0777"
}
