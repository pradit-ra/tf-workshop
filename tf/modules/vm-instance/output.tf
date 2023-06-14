output "vm_ip_address" {
  value = google_compute_instance.vm.network_interface.0.network_ip
}
