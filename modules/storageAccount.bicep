param location string
param name array
param mytags object = {
  env: 'dev'
  team: 'infra'
}

resource storage 'Microsoft.Storage/storageAccounts@2021-04-01' = [for n in name: {
  // name: '${n}storage${uniqueString(resourceGroup().id)}'
  name: '${n}'
  location: location
  tags: mytags
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}]

output storageEndpoints array = [for n in name: reference('${n}${name}').primaryEndpoints.blob]
