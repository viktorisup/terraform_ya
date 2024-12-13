terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

variable "yandex_cloud_token" {
  type = string
  description = "Введите токен"
}

provider "yandex" {
  token = var.yandex_cloud_token
  cloud_id = "b1g5hav5glefe06sf75l"
  folder_id = "b1gpdi9gi35mdf1d3q4l"
  zone = "ru-central1-a"
}
