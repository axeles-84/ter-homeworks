###########DB
resource "yandex_vpc_network" "db" {
  name = local.db_name
}
resource "yandex_vpc_subnet" "db" {
  name           = local.db_name
  zone           = var.zone_b
  network_id     = yandex_vpc_network.db.id
  v4_cidr_blocks = var.zone_b_cidr
}
resource "yandex_compute_instance" "db" {
  name        = local.db_name
  hostname    = local.db_name
  platform_id = var.vm_db_platform_id
  zone        = var.zone_b
resources {
    cores         = local.db_res.cores
    memory        = local.db_res.memory
    core_fraction = local.db_res.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vm_db_preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.db.id
    nat       = true
  }

 metadata = var.vm_metadata
   }  
  