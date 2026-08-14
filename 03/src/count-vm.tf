data "yandex_compute_image" "ubuntu" {
  family = var.vm_image_family
 }  
resource "yandex_compute_instance" "web" {
  count       = 4
  name        = "web-${count.index + 1}"
  hostname    = "web-${count.index + 1}"
  zone        = var.default_zone
  platform_id = "standard-v3"

  resources {
    cores         = 2
    memory        = 2
    core_fraction = 20
      }
scheduling_policy {
    preemptible = true
  }
 allow_stopping_for_update = true
boot_disk {
    initialize_params {
    image_id = data.yandex_compute_image.ubuntu.image_id
    size     = 5
    type     = "network-hdd"
    }
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
    security_group_ids = [yandex_vpc_security_group.example.id]
  }

  metadata = var.vm_metadata
}