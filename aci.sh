echo "Launching Nginx ACI Instance..."
{
	az group create --name test-aci --location westus

	az container create -g test-aci --name nginx-aci --image library/nginx --ip-address public
	IP=$(sed -e 's/^"//' -e 's/"$//' <<< `az container show --name nginx-aci --resource-group test-aci | jq .ipAddress.ip`)

	STATE=`az container show --name nginx-aci --resource-group test-aci | jq .state`
	while [ "$STATE" != \""Running\"" ]; do
		STATE=`az container show --name nginx-aci --resource-group test-aci | jq .state`
	done
}  &> /dev/null
curl $IP