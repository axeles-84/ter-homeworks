###cloud vars

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}
variable "vm_image_family" {
  type        = string
  description = "Семейство образа ОС для ВМ"
  default     = "ubuntu-2004-lts"
}
variable "each_vm" {
  description = "Список конфигураций для ВМ баз данных (main и replica)"
  type = list(object({
    vm_name     = string
    cpu         = number
    ram         = number
    disk_volume = number
  }))
  default = [
    {
      vm_name     = "main"
      cpu         = 2
      ram         = 4
      disk_volume = 20
    },
    {
      vm_name     = "replica"
      cpu         = 2
      ram         = 2
      disk_volume = 10
    }
  ]
}
variable "vm_metadata" {
  description = "Meta"
  type = object({
    serial-port-enable = number
    ssh-keys           = string
})
}