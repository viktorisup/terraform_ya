resource "yandex_compute_instance" "mikrot" {
  name = "mikrot"
  platform_id               = "standard-v1"
  zone                      = "ru-central1-a"
  
  resources {
    core_fraction = 20
    cores  = 2
    memory = 1
  }

  boot_disk {
    initialize_params {
      image_id = "fd84rbp1354f0g87qsup"
      size     = 1
    }
  }
# так добавляются пользователи и ключи (на этом образе почему то не работает)
  metadata = {
    serial-port-enable = 1
    user-data = "${file("/Users/admin/Documents/ya_terraform/cloud-init.yaml")}"
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.publicsubnet.id}"
    ip_address = "10.10.11.5"
    nat       = true
  }

  network_interface {
    subnet_id   = yandex_vpc_subnet.mysubnet.id
    ip_address  = "192.168.15.5"
  }
}