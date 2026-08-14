resource "yandex_compute_disk" "disk" {
  count = 3
  name  = "storage-disk-${count.index + 1}"
  type  = "network-hdd"   
  size  = 1
  zone  = var.default_zone
}
resource "yandex_compute_instance" "storage" {
  name        = "storage"
  hostname    = "storage"
  platform_id = "standard-v3"
  zone        = var.default_zone

  resources {
    cores  = 2
    memory = 2
    core_fraction = 20
  }
boot_disk {
    initialize_params {
    image_id = data.yandex_compute_image.ubuntu.image_id
    size     = 10
    type     = "network-hdd"
    }
  }
  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.disk
    content {
      disk_id = secondary_disk.value.id
    }
}  
network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = false  
  }
scheduling_policy {
    preemptible = true
  }
  allow_stopping_for_update = true
  metadata = var.vm_metadata
}
