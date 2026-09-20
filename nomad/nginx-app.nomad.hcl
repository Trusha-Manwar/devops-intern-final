variable "image_tag" {
  type    = string
  default = "latest"
}

job "nginx-app" {
  datacenters = ["dc1"]
  type        = "service"

  group "nginx" {
    count = 1

    update {
      max_parallel     = 1
      min_healthy_time = "10s"
      healthy_deadline = "2m"
      auto_revert      = true
    }

    network {
      port "http" {
        to = 8080
      }
    }

    task "nginx" {
      driver = "docker"

      config {
        image = "ghcr.io/trusha-manwar/devops-intern-final:${var.image_tag}"
        ports = ["http"]
      }

      resources {
        cpu    = 100
        memory = 64
      }

      service {
        name = "nginx-app"
        port = "http"
        provider = "consul"

        check {
          type     = "http"
          path     = "/healthz"
          interval = "10s"
          timeout  = "2s"
        }
      }

      restart {
        attempts = 2
        interval = "30m"
        delay    = "15s"
        mode     = "fail"
      }

      reschedule {
        attempts       = 3
        interval       = "30m"
        delay          = "30s"
        delay_function = "exponential"
      }
    }
  }
}
