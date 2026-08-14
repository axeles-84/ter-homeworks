resource "yandex_compute_instance" "db" {
  for_each = { for vm in var.each_vm : vm.vm_name => vm }

  name        = "db-${each.value.vm_name}"
  hostname    = "db-${each.value.vm_name}"
  zone        = var.default_zone   
  platform_id = "standard-v3"

  resources {
    cores         = each.value.cpu
    memory        = each.value.ram
    core_fraction = 20
  }
scheduling_policy {
    preemptible = true
  }
  allow_stopping_for_update = true
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size     = each.value.disk_volume
      type     = "network-hdd"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = false  
  }

  metadata = var.vm_metadata
}
