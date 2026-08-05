resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.zone_a
  network_id     = yandex_vpc_network.develop.id
 v4_cidr_blocks = var.zone_a_cidr
}


data "yandex_compute_image" "ubuntu" {
  family = var.vm_image_family
}
resource "yandex_compute_instance" "platform" {
  name        = local.web_name
  hostname    = local.web_name
  zone        = var.zone_a
  platform_id = var.vm_web_platform_id
  resources {
    cores         = var.vm_web_cores
    memory        = var.vm_web_memory
    core_fraction = var.vm_web_core_fraction
  }
  boot_disk {
    initialize_params {image_id = data.yandex_compute_image.ubuntu.image_id}
  }
  scheduling_policy {
    preemptible = var.vm_web_preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }
 metadata = {
    serial-port-enable = 1
  ssh-keys = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAifb50v1JFrkXnwXyS9Yvp4pfOJwO3EdzY6KWRld/DU user@ubuntu"
   }  
}