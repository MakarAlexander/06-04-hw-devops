## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.8.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | 0.130.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [yandex_vpc_network.network](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_network) | resource |
| [yandex_vpc_subnet.subnet](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | The name of the VPC network | `string` | `"n-e-t-w-o-r-k"` | no |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | The name of the VPC subnet | `string` | `"s-u-b-n-e-t-w-o-r-k"` | no |
| <a name="input_v4_cidr_blocks"></a> [v4\_cidr\_blocks](#input\_v4\_cidr\_blocks) | IPv4 CIDR blocks for the subnet | `list(string)` | <pre>[<br/>  "10.0.1.0/24"<br/>]</pre> | no |
| <a name="input_zone"></a> [zone](#input\_zone) | The availability zone where the subnet will be created | `string` | `"ru-central1-a"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_out_network"></a> [out\_network](#output\_out\_network) | Network information |
| <a name="output_out_subnet"></a> [out\_subnet](#output\_out\_subnet) | Subnetwork information |