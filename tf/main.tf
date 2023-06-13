resource "google_compute_network" "net" {
  name                    = "${var.prefix}-net"
  auto_create_subnetworks = false
}

# resource "google_compute_subnetwork" "pub_subnet" {
#   name          = "${var.prefix}-public"
#   network       = google_compute_network.net.id
#   ip_cidr_range = "10.20.1.0/24" # 255 ips
#   region        = "asia-southeast1"
# }

# resource "google_compute_subnetwork" "pri_subnet" {
#   name                     = "${var.prefix}-private"
#   network                  = google_compute_network.net.id
#   ip_cidr_range            = "10.20.2.0/24" # 255 ips
#   region                   = "asia-southeast1"
#   private_ip_google_access = true
# }

# resource "google_compute_firewall" "allow_ssh" {
#   name     = "${var.prefix}-allow-ssh"
#   network  = google_compute_network.net.name
#   priority = 65534
#   allow {
#     protocol = "icmp"
#   }

#   allow {
#     protocol = "tcp"
#     ports    = ["22"]
#   }
#   source_ranges = ["0.0.0.0/0"]
#   target_tags   = ["${var.prefix}-allow-ssh"]
# }

# # # Next create VM in the vpc network
# resource "google_compute_instance" "vm_bastion" {
#   name         = "${var.prefix}-bastion-instance"
#   machine_type = "f1-micro"
#   tags         = ["${var.prefix}-allow-ssh"]
#   boot_disk {
#     initialize_params {
#       image = "debian-cloud/debian-11"
#     }
#   }

#   network_interface {
#     network    = google_compute_network.net.name
#     subnetwork = google_compute_subnetwork.pub_subnet.id
#     access_config {
#       // Ephemeral public IP
#     }
#   }

#   metadata = google_compute_project_metadata.pub_key.metadata
# }

# # # Next create VM in the vpc network
# resource "google_compute_instance" "vm_private" {
#   name         = "${var.prefix}-pri-instance"
#   machine_type = "f1-micro"
#   tags         = ["${var.prefix}-allow-ssh"]
#   boot_disk {
#     initialize_params {
#       image = "debian-cloud/debian-11"
#     }
#   }
#   network_interface {
#     network    = google_compute_network.net.name
#     subnetwork = google_compute_subnetwork.pri_subnet.id
#     # access_config {
#     #   // Ephemeral public IP
#     # }
#   }

#   metadata = google_compute_project_metadata.pub_key.metadata
# }

# resource "google_compute_project_metadata" "pub_key" {
#   metadata = {
#     ssh-keys = file("../.ssh/ed25519.pub")
#   }
# }



# resource "google_compute_router" "router" {
#   name    = "${var.prefix}-router"
#   region  = google_compute_subnetwork.pri_subnet.region
#   network = google_compute_network.net.id
# }

# resource "google_compute_router_nat" "nat" {
#   name                               = "${var.prefix}-nat"
#   router                             = google_compute_router.router.name
#   region                             = google_compute_subnetwork.pri_subnet.region
#   nat_ip_allocate_option             = "AUTO_ONLY"
#   source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
#   subnetwork {
#     name                    = google_compute_subnetwork.pri_subnet.name
#     source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
#   }
#   log_config {
#     enable = true
#     filter = "ERRORS_ONLY"
#   }
# }
