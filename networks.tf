resource "yandex_vpc_network" "mynet" {
  name = "mynet"
}

resource "yandex_vpc_subnet" "mysubnet" {
  name = "mysubnet"
  v4_cidr_blocks = ["192.168.15.0/24"]
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.mynet.id
}
resource "yandex_vpc_subnet" "publicsubnet" {
  name = "publicsubnet"
  v4_cidr_blocks = ["10.10.11.0/24"]
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.mynet.id
}