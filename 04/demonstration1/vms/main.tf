#создаем облачную сеть
# resource "yandex_vpc_network" "develop" {
#   name = "develop"
# }

# #создаем подсеть
# resource "yandex_vpc_subnet" "develop_a" {
#   name           = "develop-ru-central1-a"
#   zone           = "ru-central1-a"
#   network_id     = yandex_vpc_network.develop.id
#   v4_cidr_blocks = ["10.0.1.0/24"]
# }

# resource "yandex_vpc_subnet" "develop_b" {
#   name           = "develop-ru-central1-b"
#   zone           = "ru-central1-b"
#   network_id     = yandex_vpc_network.develop.id
#   v4_cidr_blocks = ["10.0.2.0/24"]
# }

module "vpc" {
  source         = "./local_modules/vpc"
  network_name   = var.vpc_name
  zone           = var.default_zone
  v4_cidr_blocks = var.default_cidr
}

module "marketing-vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = "develop" 
  # network_id     = yandex_vpc_network.develop.id
  network_id     = module.vpc.out_network.id
  # subnet_zones   = ["ru-central1-a","ru-central1-b"]
  subnet_zones   = [var.default_zone]
  # subnet_ids     = [yandex_vpc_subnet.develop_a.id,yandex_vpc_subnet.develop_b.id]
  subnet_ids     = [module.vpc.out_subnet.id]
  instance_name  = "marketing-web"
  instance_count = 1
  image_family   = "ubuntu-2004-lts"
  public_ip      = true

  labels = { 
    owner= "cloud-alex",
    project = "marketing"
     }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered #Для демонстрации №3
    serial-port-enable = 1
  }

}

module "analytics-vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = "stage"
  # network_id     = yandex_vpc_network.develop.id
  network_id     = module.vpc.out_network.id
  # subnet_zones   = ["ru-central1-a"]
  subnet_zones   = [var.default_zone]
  # subnet_ids     = [yandex_vpc_subnet.develop_a.id]
  subnet_ids     = [module.vpc.out_subnet.id]
  instance_name  = "analytics-web"
  instance_count = 1
  image_family   = "ubuntu-2004-lts"
  public_ip      = true

  labels = { 
    owner= "cloud-alex",
    project = "analytics"
     }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered #Для демонстрации №3
    serial-port-enable = 1
  }

}

#Передача cloud-config в ВМ
data "template_file" "cloudinit" {
  template = file("./cloud-init.yml")
  vars = {
    ssh_public_key = file(var.ssh_public_key)
  }
}

