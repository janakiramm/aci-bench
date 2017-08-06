# Benchmarking startup time for Azure Containers and VMs
Use these scripts to benchmark the startup time of local Docker, Azure Container Instance, and Azure VM. For Docker and ACI, I used the latest Nginx image from Docker Hub. Azure VM uses the pre-configured Bitnami image for Nginx. Both ACI and Azure VM are launched in US West.

Please install [jq](https://stedolan.github.io/jq/) before running these scripts. You also need the latest version of [Azure CLI](https://github.com/Azure/azure-cli). 

After configuring Azure CLI and cloning the repo, run 

```shell
chmod +x ./*.sh
./bench.sh
```
At the end of the execution, you will see the time in seconds to launch each resource. At the end run ```cleanup.sh``` to delete all the resources.
