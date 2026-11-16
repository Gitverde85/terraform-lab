#!/bin/bash

# 1. Define variables (Change the storage name if needed)
RG_NAME="rg-lab-terraform-backend"
LOCATION="eastus"
STORAGE_NAME="labtfstatestorageaccount" 
CONTAINER_NAME="tfstate"

echo "Starting Azure authentication..."
az login

echo "Creating Resource Group ($RG_NAME)..."
az group create --name $RG_NAME --location $LOCATION

echo "Creating Storage Account ($STORAGE_NAME)..."
az storage account create \
  --name $STORAGE_NAME \
  --resource-group $RG_NAME \
  --sku Standard_LRS \
  --encryption-services blob

echo "Creating Blob Container ($CONTAINER_NAME)..."
az storage container create \
  --name $CONTAINER_NAME \
  --account-name $STORAGE_NAME \
  --auth-mode login

echo "All done! Your remote backend infrastructure has been successfully created."
