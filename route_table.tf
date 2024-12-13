resource "yandex_vpc_route_table" "inet" {
  name       = "inet"
  network_id = "${yandex_vpc_network.mynet.id}"
  static_route {
    destination_prefix = "0.0.0.0/0"
    next_hop_address   = "10.10.11.5"
  }
}