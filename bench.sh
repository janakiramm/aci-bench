# Local Docker Environment
local_start=`date +%s`
./local.sh
local_end=`date +%s`
local_runtime=$((local_end-local_start))
# ACI Environment
aci_start=`date +%s`
./aci.sh
aci_end=`date +%s`
aci_runtime=$((aci_end-aci_start))
# Azure VMs
vm_start=`date +%s`
./vm.sh
vm_end=`date +%s`
vm_runtime=$((vm_end-vm_start))

echo "Local Docker Environment - "$local_runtime " seconds"
echo "ACI Environment - "$aci_runtime " seconds"
echo "VM Environment - "$vm_runtime " seconds"
