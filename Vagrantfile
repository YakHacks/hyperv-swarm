# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

    config.vm.box = "generic/alpine313"
    config.vm.provider "hyperv"
    config.vm.network "public_network", bridge: "External"
    config.vm.provision "shell", path: "provision/docker_setup.sh"
    (1..3).each do |number|
        config.vm.define "docker-#{number}" do |node|
            node.vm.hostname = "docker-#{number}"
        end  
    end

end
