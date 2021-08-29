# Gator

this demonstrates 
1) module consumption
2) parameters file and using a parameters in module consumption
3) defining parameters for consumption in the module
4) using a for loop to create multiple resources from an array
5) output items from an array
6) Passes thru array from parameters file into module

# Overview:
Modules are for consumption
main.tf is for your overall purpose. You might want to create 3 VMs that consume modules to create these resources.
Modules can be separated out into a git repo for re-useability, which leaves developers to use modules to accomplish infra creation goals

# Notes
- params are for declaring data (type, value) eg param location string = 'asd'
- vars are for manipulating data (functions) eg var stgAccName = '${param1}${param2}'


- Properties you want to be parameterised need to be defined as params in the resource block.

- Properties you want to pass through to the module need to be defined and valued and sent through in the params block of the module

- resource item: Output properties in the resource block using a unique identifier of the output item
 <!-- output storageEndpoint object = storage.properties.primaryEndpoints -->
 
- module item: create an output item that uses properties from the resource items output list of properties
<!-- output storagemoduleoutput object = storageModule.outputs.storageEndpoint -->


# DOCO
https://docs.microsoft.com/en-us/azure/azure-resource-manager/bicep/loop-outputs

