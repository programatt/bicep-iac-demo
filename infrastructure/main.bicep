param location string = 'centralus'
param environment string

var appName = 'devops-days'
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
    appName: 'devopsdays'
    environment: environment
    location: location
  }
}
