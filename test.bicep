// this uses a var for the name, var combines 2 params


param location string
param name array
param mytags object = {
  env: 'dev'
  team: 'infra'
}
@minLength(3)
@maxLength(19)
param stgActNamePrefix string = 'asd'

var uniqueId = uniqueString(resourceGroup().id, deployment().name)
var uniqueIdShort = take(uniqueId,5)
var stgAccName = '${stgActNamePrefix}${uniqueIdShort}'
// ${} means bicep will use the literaly value of the parameter WHEN USED TOGETHER with another, unless its not required (reference var directly by its name)

resource storage 'Microsoft.Storage/storageAccounts@2021-04-01' =  {
  // name: '${n}storage${uniqueString(resourceGroup().id)}'
  name: stgAccName
  location: location
  tags: mytags
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}

output storageEndpoints array = [for n in name: reference('${n}${name}').primaryEndpoints.blob]
