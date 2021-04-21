# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

    config.vm.box = "generic/alpine313"
    config.vm.provider "hyperv"
    config.vm.network "public_network", bridge: "External"
    config.vm.provision "shell", path: "provision/docker_setup.sh"
    
    config.vm.define "swarm-manager" do |manager|
        manager.vm.provider "hyperv" do |hyperv|
            hyperv.vmname = "swarm-manager"
        end
        manager.vm.hostname = "swarm-manager"
        manager.trigger.after :up do |after_up|
            after_up.name = "swarm_init"
            after_up.info = "Initializing swarm"
            after_up.run = {path: '.\trigger\swarm_init.ps1', args: "swarm-manager"}
        end
    end

    (1..2).each do |number|
        config.vm.define "swarm-worker#{number}" do |worker|

            worker.vm.provider "hyperv" do |hyperv|
                hyperv.vmname = "swarm-worker#{number}"
            end
            worker.vm.hostname = "swarm-worker#{number}"
            worker.trigger.after :up do |after_up|
                after_up.name = "swarm_join"
                after_up.info = "Joining swarm"
                after_up.run = {path: '.\trigger\swarm_join.ps1', args: ["swarm-manager", "swarm-worker#{number}"]}
            end
        end  
    end

end
