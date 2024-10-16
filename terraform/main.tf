module "vpc" {
  source         = "./local_modules/vpc"
  network_name   = var.vpc_name
  zone           = var.default_zone
  v4_cidr_blocks = var.default_cidr
}

module "marketing-vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = var.marketing_vm_env 
  network_id     = module.vpc.out_network.id
  subnet_zones   = [var.default_zone]
  subnet_ids     = [module.vpc.out_subnet.id]
  instance_name  = var.marketing_vm_instance_name
  instance_count = var.marketing_vm_instance_count
  image_family   = var.marketing_vm_image_family
  public_ip      = var.marketing_vm_public_ip

  labels = { 
    owner= var.marketing_vm_labels.owner
    project = var.marketing_vm_labels.project
     }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered #Для демонстрации №3
    serial-port-enable = var.marketing_vm_serial_port_enable
  }

}

module "analytics-vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = var.analytics_vm_env 
  network_id     = module.vpc.out_network.id
  subnet_zones   = [var.default_zone]
  subnet_ids     = [module.vpc.out_subnet.id]
  instance_name  = var.analytics_vm_instance_name
  instance_count = var.analytics_vm_instance_count
  image_family   = var.analytics_vm_image_family
  public_ip      = var.analytics_vm_public_ip

  labels = { 
    owner= var.analytics_vm_labels.owner
    project = var.analytics_vm_labels.project 
     }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered #Для демонстрации №3
    serial-port-enable = var.analytics_vm_serial_port_enable
  }

}

#Передача cloud-config в ВМ
data "template_file" "cloudinit" {
  template = file("./cloud-init.yml")
  vars = {
    ssh_public_key = file(var.ssh_public_key)
    packages       = jsonencode(var.packages)
  }

}

