output "out_network" {
  description = "Network information"
  value       = yandex_vpc_network.network
}

output "out_subnet" {
  description = "Subnetwork information"
  value       = yandex_vpc_subnet.subnet
}