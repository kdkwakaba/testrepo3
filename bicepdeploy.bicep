@description('Vnet name')
param vnetName string = 'bicepdeploy-vnet'

@description('Address prefix')
param vnetAddressPrefix string = '172.16.0.0/16'

@description('Subnet Prefix')
param subnetPrefix string = '172.16.0.0/24'

@description('Subnet Name')
param subnetName string = 'bicepdeploy-snet'

@description('Location for all resources.')
param location string = resourceGroup().location

resource vnet 'Microsoft.Network/virtualNetworks@2021-08-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnetAddressPrefix
      ]
    }
    subnets: [
      {
        name: subnetName
        properties: {
          addressPrefix: subnetPrefix
        }
      }
    ]
  }
}
