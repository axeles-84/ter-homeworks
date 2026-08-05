locals {
  web_name = "${var.zone_a}-web"
  db_name  = "${var.zone_b}-db"
}

#web_res = var.vms_resources["web"]
#db_res  = var.vms_resources["db"]