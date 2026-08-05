###cloud vars


variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "zone_a" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
  variable "zone_b" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "zone_a_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "zone_b_cidr" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

variable "vpc_name_db" {
  type        = string
  default     = "DB"
  description = "VPC network & subnet name"
}


###ssh vars
variable "vms_ssh_public_root_key" {
  type        = string
}






variable "vm_image_family" {
  type        = string
  description = "Семейство образа ОС для ВМ"
  default     = "ubuntu-2004-lts"
}


variable "vm_web_name" {
  type        = string
  description = "Имя виртуальной машины"
  default     = "netology-develop-platform-web"
}

variable "vm_web_platform_id" {
  type        = string
  description = "Платформа ВМ"
  default     = "standard-v3"
}

variable "vm_web_cores" {
  type        = number
  description = "Количество ядер CPU"
  default     = 2
}

variable "vm_web_memory" {
  type        = number
  description = "Объем RAM в ГБ"
  default     = 4
}

variable "vm_web_core_fraction" {
  type        = number
  description = "Гарантированная доля vCPU"
  default     = 20
}

variable "vm_web_preemptible" {
  type        = bool
  description = "Признак прерываемой ВМ"
  default     = true
}

###########DB



# Переменные для ВМ (префикс vm_db_)
variable "vm_db_name" {
  type        = string
  description = "Имя виртуальной машины"
  default     = "netology-develop-platform-db"
}

variable "vm_db_platform_id" {
  type        = string
  description = "Платформа ВМ"
  default     = "standard-v3"
}

variable "vm_db_cores" {
  type        = number
  description = "Количество ядер CPU"
  default     = 2
}

variable "vm_db_memory" {
  type        = number
  description = "Объем RAM в ГБ"
  default     = 2
}

variable "vm_db_core_fraction" {
  type        = number
  description = "Гарантированная доля vCPU"
  default     = 20
}

variable "vm_db_preemptible" {
  type        = bool
  description = "Признак прерываемой ВМ"
  default     = true
}
