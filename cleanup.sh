docker rm -f nginx
docker rmi -f nginx
az group delete --name test-aci --yes --no-wait
az group delete --name test-vm --yes --no-wait