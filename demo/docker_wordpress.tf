resource docker_container wordpress {
  name     = "wordpress-container"
  image    = "${docker_image.wordpress.latest}"
  networks = ["${docker_network.private_network.name}"]
  env      = ["WORDPRESS_DB_PASSWORD=example"]

  ports {
    internal = 80
    external = 8080
    protocol = "tcp"
  }
}

resource docker_container mysql {
  name     = "mysql-container"
  image    = "${docker_image.wordpress.latest}"
  networks = ["${docker_network.private_network.name}"]
  env      = ["MYSQL_ROOT_PASSWORD=example"]
}

# Find the latest Wordpress latest image.
resource docker_image wordpress {
  name         = "wordpress:latest"
  keep_locally = true
}

# Find the latest mysql image.
resource docker_image mysql {
  name         = "mysql:5.7"
  keep_locally = true
}

# Create a new docker network
resource "docker_network" "private_network" {
  name        = "app_net"
  driver      = "bridge"
  ipam_driver = "default"

  ipam_config {
    subnet = "172.16.86.0/24"
  }
}
