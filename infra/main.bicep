metadata description = 'Provisions resources for Azure SQL Database with AdventureWorks pre-installed'

targetScope = 'resourceGroup'

@minLength(1)
@maxLength(64)
@description('Name of the environment that can be used as part of naming resource convention.')
param environmentName string

@minLength(1)
@description('Primary location for all resources.')
param location string

var resourceToken = toLower(uniqueString(resourceGroup().id, environmentName, location))
var tags = {
  'azd-env-name': environmentName
  repo: 'https://github.com/azure-samples/databaase-templates-sql-adventureworks'
}

module sql 'br/public:avm/res/sql/server:0.10.1' = {
  name: 'sql-server'
  params: {
    name: 'sql-server-${resourceToken}'
    location: location
    tags: tags
    administratorLogin: 'sqladmin'
    administratorLoginPassword: 'P@ssw.rd'
    firewallRules: [
      {
        startIpAddress: '0.0.0.0'
        name: 'AllowAllIps'
        endIpAddress: '255.255.255.255'
      }
    ]
    databases: [
      {
        name: 'AdventureWorksLT'
        sampleName: 'AdventureWorksLT'
        autoPauseDelay: 60
        minCapacity: '0.5'
        sku: {
          name: 'GP_S_Gen5_1'
          tier: 'GeneralPurpose'
        }
        zoneRedundant: false
      }
    ]
  }
}
