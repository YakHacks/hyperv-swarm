$manager_vmname = $Args[0]
$manager_ip = (Get-VM | Where-Object -Property Name -EQ $manager_vmname | Select-Object -ExpandProperty NetworkAdapters | Select-Object -ExpandProperty IPAddresses)[0]
ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -i .vagrant/machines/$manager_vmname/hyperv/private_key -l vagrant $manager_ip "docker swarm init > /dev/null"