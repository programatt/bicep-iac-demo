param location string = 'centralus'
@allowed(['dev', 'test', 'prod'])
param environment string

var appName = 'icc'
var appNameWithEnvironment = '${appName}-${environment}'

targetScope = 'subscription'

resource rg 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: 'rg-${appNameWithEnvironment}'
  location: location
}

module app './appservice.bicep' = {
  name: 'appservice'
  scope: rg
  params: {
    appName: appNameWithEnvironment
    environment: environment
    location: location
  }
}
