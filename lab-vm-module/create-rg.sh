RG_NAME="rg-terraform-modules-$(date +%s)"
LOCATION="eastus"

echo "Creating Resource Group: $RG_NAME..."
az group create --name "$RG_NAME" --location "$LOCATION"