variable "client" {
    description = "Client of TCS for which the resources are created"
    type = string  
}

variable "environment" {
    description = "the environment for which the resources are created"
    type = string
}

variable "resourcegroupname" {
    description = "Contains the resource group name"
    type = string
}

variable "resourcegrouplocation" {
    description = "Contains the resource group location" 
    type = string
}

variable "vnetname" {
    description = "Contains the vnet name suffix"
    type = string
}

variable "vnetaddress" {
    description = "Contains the vnet address range "
    type = list(string)
}

variable "webSubnetname" {
    description = "Contains the websubnet name suffix"
    type = string
}

variable "websubnetaddress" {
    description = "Contains the websubnet address range "
    type = list(string)
}

variable "dbsubnetname" {
    description = "Contains the dbsubnet name suffix"
    type = string
}

variable "dbsubnetaddress" {
    description = "Contains the dbsubnet address range "
    type = list(string)
}

variable "webnsg" {
  description = "Contains name of web nsg"
  type = string
}

variable "dbnsg" {
  description = "Contains name of db nsg"
  type = string
}

variable "hostname" {
    description = "Contains the hostname suffix of linux vm"
    type = string
}

variable "size" {
    description = "Contains the size of the linux vm"
    type = string  
}

variable "user" {
    description = "Contains the admin username"
    type = string  
}

variable "password" {
    description = "Contains the admin user password"
    type = string 
}

variable "sourceimage" {
    description = "Contains the source image reference"
    type = map(string)  
}

variable "pubipname" {
    description = "Contains the pubip suffix"
    type = string  
}

variable "vnicname" {
    description = "Contains the suffix of the vnic name"
    type = string  
}

variable "privateip" {
    description = "Contains the static private ip"
    type = string
}