brew tap hashicorp/tap
brew install hashicorp/tap/terraform
terraform -v
curl -sSL https://storage.yandexcloud.net/yandexcloud-yc/install.sh | bash - яндекс cli
brew install zsh-completion - автодополнение команд
yc init - инициализация профиля
yc config list - список настроек
yc iam service-account create --name <имя_сервисного_аккаунта> - создаем сервисный аккаунт
yc iam service-account list - список сервисных аккаунтов
yc compute instance list - список виртуалок
yc <service-name> <resource> add-access-binding <resource-name>|<resource-id> --role <role-id> --subject serviceAccount:<service-account-id> - назначение роли
yc iam key create \
  --service-account-id <идентификатор_сервисного_аккаунта> \
  --folder-name <имя_каталога_с_сервисным_аккаунтом> \
  --output key.json                                              - генерация ключа
yc config profile create <имя_профиля>  - создание профиля
yc resource-manager cloud list - список имен облаков
yc resource-manager cloud get <имя_облака> - получение индентификатора
yc resource-manager folder list - список каталогов
yc resource-manager folder get my-folder - индентификатор каталогов
# Задаем конфигурацию профиля
yc config set service-account-key key.json
yc config set cloud-id <идентификатор_облака>
yc config set folder-id <идентификатор_каталога>
# Добавьте аутентификационные данные в переменные окружения(токен действует 12 часов)
export YC_TOKEN=$(yc iam create-token)
export YC_CLOUD_ID=$(yc config get cloud-id)
export YC_FOLDER_ID=$(yc config get folder-id)

yc compute image list --folder-id standard-images - список образов системы

# Укажите источник, из которого будет устанавливаться провайдер.
nano ~/.terraformrc

содержимое
provider_installation {
  network_mirror {
    url = "https://terraform-mirror.yandexcloud.net/"
    include = ["registry.terraform.io/*/*"]
  }
  direct {
    exclude = ["registry.terraform.io/*/*"]
  }
}

# манифест main.tf

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
  cloud_id = ""
  folder_id = "b1gpdi9gi35mdf1d3q4l"
  zone = "ru-central1-a"
}

terraform init - инициализация тераформа и скачивание нужного провайдера
terraform validate - проверка конфигураций
terraform fmt - форматирование конфигураций
terraform plan - результат с планом что будет развернуто
terraform apply - приминить конфигурацию
terraform destroy - уничтожить конфигурацию