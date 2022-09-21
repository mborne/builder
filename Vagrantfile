# -*- mode: ruby -*-
# vi: set ft=ruby :

BUILDER_BOX     = ENV["BUILDER_BOX"] || "ubuntu/focal64"
BUILDER_COUNT   = ENV["BUILDER_COUNT"] || 2
BUILDER_COUNT   = BUILDER_COUNT.to_i
BUILDER_NETWORK = ENV["BUILDER_NETWORK"] || "192.168.50"


Vagrant.configure("2") do |config|

  (1..BUILDER_COUNT).each do |i|
    config.vm.box = BUILDER_BOX
    config.vm.define "builder-#{i}" do |node|
      node.vm.hostname = "builder-#{i}"
      node.vm.network "private_network", ip: "#{BUILDER_NETWORK}.3#{i}"
      node.vm.provider "virtualbox" do |vb|
        vb.name = "builder-#{i}"
        vb.gui = false
        vb.memory = "2048"
      end
    end

    #config.vm.synced_folder '.', '/vagrant', disabled: true
    config.vm.provision "shell", path: "setup.sh"
  end

end
