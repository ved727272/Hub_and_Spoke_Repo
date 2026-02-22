variable "peerings" {
  type = map(object({
    source_vnet_name        = string
    source_rg               = string
    remote_vnet_name        = string
    remote_rg               = string
    allow_forwarded_traffic = bool
    allow_gateway_transit   = bool
    use_remote_gateways     = bool
  }))
}