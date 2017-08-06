echo "Launching Nginx Azure VM..."
{
	az group create --name test-vm --location westus

	az vm create \
	--location westus \
	--resource-group test-vm \
	--name nginx-vm \
	--image bitnami:nginxstack:1-9:latest  \
	--admin-username azureuser \
	--admin-password AzureUser@123

	IP=$(sed -e 's/^"//' -e 's/"$//' <<< `az vm list-ip-addresses --name nginx-vm --resource-group test-vm | jq '.[].virtualMachine.network.publicIpAddresses[0].ipAddress'`)
	az vm open-port --port 80 --resource-group test-vm  --name nginx-vm

	STATE=`az vm show --name nginx-vm --resource-group test-vm --show-details | jq '.powerState'`
	while [ "$STATE" != \""VM running\"" ]; do
		STATE=`az vm show --name nginx-vm --resource-group test-vm --show-details | jq '.powerState'`
	done
}  &> /dev/null
curl $IP