#!/bin/bash

# quit if any command fails
set -e

# Variables
RESOURCE_GROUP="rg-tf-vm-keyvault"
LOCATION="eastus"
KEY_VAULT_NAME="kv-terraform-lab-$RANDOM" # Add a random number to ensure a unique name
SECRET_NAME="vmPassword"
SECRET_VALUE="SuperSecretPassword123!" # In a real scenario, consider generating this securely

echo "Verifying authentication with Azure..."
if ! az account show &>/dev/null; then
    echo "You are not logged into the Azure CLI. Please run 'az login' first."
    exit 1
fi

echo "Starting infrastructure automation..."

# 1. Create the Resource Group
echo "Creating Resource Group: $RESOURCE_GROUP..."
az group create --name "$RESOURCE_GROUP" --location "$LOCATION" --output table

# 2. Create the Key Vault
echo "Creating Key Vault: $KEY_VAULT_NAME (this may take a moment)..."
# Add --enable-rbac-authorization false  (ForbiddenByRbac)
az keyvault create \
  --name "$KEY_VAULT_NAME" \
  --resource-group "$RESOURCE_GROUP" \
  --location "$LOCATION" \
  --enable-rbac-authorization false \
  --output table

# 3. Set the Secret
echo "Setting the secret '$SECRET_NAME' in the Key Vault..."
az keyvault secret set \
  --vault-name "$KEY_VAULT_NAME" \
  --name "$SECRET_NAME" \
  --value "$SECRET_VALUE" \
  --output table

echo "Infrastructure automation completed successfully!"
echo "Your Key Vault is ready: $KEY_VAULT_NAME"