$manager_vmname = $Args[0]
$worker_vmname = $Args[1]
$manager_ip = (Get-VM | Where-Object -Property Name -EQ $manager_vmname | Select-Object -ExpandProperty NetworkAdapters | Select-Object -ExpandProperty IPAddresses)[0]
$worker_ip = (Get-VM | Where-Object -Property Name -EQ $worker_vmname | Select-Object -ExpandProperty NetworkAdapters | Select-Object -ExpandProperty IPAddresses)[0]
$join_command = (ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -i .vagrant/machines/$manager_vmname/hyperv/private_key -l vagrant $manager_ip "docker swarm join-token worker" | Select-String -Pattern "docker swarm join --token .*").Matches[0].Value
ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -i .vagrant/machines/$worker_vmname/hyperv/private_key -l vagrant $worker_ip $join_command