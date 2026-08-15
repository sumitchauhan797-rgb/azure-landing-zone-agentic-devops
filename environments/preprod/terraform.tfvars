resource_groups = {
  platform = {
    name     = "rg-alz-preprod-platform"
    location = "Central India"
  }
  network = {
    name     = "rg-alz-preprod-network"
    location = "Central India"
  }
}
vnets = {

  hub = {
    name                = "vnet-alz-preprod-hub"
    location            = "Central India"
    resource_group_name = "rg-alz-preprod-network"
    address_space       = ["10.20.0.0/16"]
  }
}
subnets = {
  subnet1 = {
    name                 = "AzureFirewallSubnet"
    resource_group_name  = "rg-alz-preprod-network"
    virtual_network_name = "vnet-alz-preprod-hub"
    address_prefixes     = ["10.20.1.0/24"]
  }
  subnet2 = {
    name                 = "workload-subnet"
    resource_group_name  = "rg-alz-preprod-network"
    virtual_network_name = "vnet-alz-preprod-hub"
    address_prefixes     = ["10.20.2.0/24"]
  }
}
NSGs = {
  NSG1 = {
    name                = "nsg-alz-preprod-workload"
    location            = "Central India"
    resource_group_name = "rg-alz-preprod-network"

    Security_name              = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}


 