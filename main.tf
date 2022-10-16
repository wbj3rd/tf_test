terraform {
  cloud {
    organization = "Software-Scientist"
    workspaces {
      name = "tf_test"
    }
  }
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.0.0"
    }    
  }
}

provider "docker" {
  
}
resource "docker_image" "nginx" {
  name         = "nginx"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = "tutorial"
  ports {
    internal = 80
    external = 8000
  }
}