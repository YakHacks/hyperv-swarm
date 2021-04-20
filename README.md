# Hyper V Docker Swarm

Just an experiment to learn a bit about Vagrant. The Vagrantfile here will provision 3 Alpine VMs with Docker isntalled. I couldn't find a way to set up the swarm itself with Vagrant, so the included Powershell script will finish the job.

1. Create an External VM Switch for the VMs
2. Run `vagrant up`
3. Run `.\swarm_up.ps1`
