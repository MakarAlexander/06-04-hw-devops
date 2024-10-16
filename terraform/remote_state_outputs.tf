output "out" {

    value=concat(module.marketing-vm.fqdn , module.analytics-vm.fqdn)
}
