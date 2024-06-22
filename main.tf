terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "whoami" {
  name         = "traefik/whoami:v1.8"
  keep_locally = false
}

resource "docker_container" "whoami" {
  image = docker_image.whoami.image_id
  name  = "whoami"
  ports {
    internal = 80
    external = 8000
  }
}
