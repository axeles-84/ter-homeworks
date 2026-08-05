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
  zone        = local.web_res.zone
  platform_id = var.vm_web_platform_id
  resources {
    cores         = local.web_res.cores
    memory        = local.web_res.memory
    core_fraction = local.web_res.core_fraction
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
  metadata = var.vm_metadata
}