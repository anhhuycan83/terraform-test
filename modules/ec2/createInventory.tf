### The Ansible inventory file

resource "local_file" "AnsibleInventory" {
#  content = templatefile("${path.root}/inventory/inventory.tmpl"
  filename = "inventory"
  content = templatefile("${path.module}/inventory/inventory.tmpl",
  {
    bastion-dns = aws_instance.ec2_test.public_dns,
    bastion-ip = aws_instance.ec2_test.public_ip,
    bastion-id = aws_instance.ec2_test.id
  }
 )
}