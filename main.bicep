// param myLocation string = 'australiasoutheast'
param myLocation string
param myNames array

module storageModule 'modules/storageAccount.bicep' = {
  name: 'test'
  params: {
    location: myLocation
    name: myNames
  }
}

output outputfrom array = storageModule.outputs.storageEndpoints

