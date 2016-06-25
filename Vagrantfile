# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "boxcutter/ubuntu1604"
  
  config.vm.define "master" do |master|
    
    config.vm.network "private_network", ip: "192.168.50.10"
    
    master_disk1 = "master_disk1.vdi"
    master_disk2 = "master_disk2.vdi"
  
    config.vm.provider "virtualbox" do | vbox |
      
      vbox.memory = 1024
      vbox.cpus = 1
      
      unless File.exist?(master_disk1)
        vbox.customize ['createhd', '--filename', master_disk1, '--size', 10 * 1024]
        vbox.customize ['createhd', '--filename', master_disk2, '--size', 10 * 1024]
      end
      vbox.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', master_disk1]
      vbox.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', 2, '--device', 0, '--type', 'hdd', '--medium', master_disk2]
    end
  
  end
  
  config.vm.define "node1" do |node|
    
    config.vm.network "private_network", ip: "192.168.50.1"
    
    node1_disk1 = "node1_disk1.vdi"
    node1_disk2 = "node1_disk2.vdi"
  
    config.vm.provider "virtualbox" do | vbox |
    
      vbox.memory = 2048
      vbox.cpus = 2
    
      unless File.exist?(node1_disk1)
        vbox.customize ['createhd', '--filename', node1_disk1, '--size', 10 * 1024]
        vbox.customize ['createhd', '--filename', node1_disk2, '--size', 10 * 1024]
      end
      vbox.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', node1_disk1]
      vbox.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', 2, '--device', 0, '--type', 'hdd', '--medium', node1_disk2]
    end
  
  end
  
  config.vm.define "node2" do |node|
  
    config.vm.network "private_network", ip: "192.168.50.2"
    
    node2_disk1 = "node2_disk1.vdi"
    node2_disk2 = "node2_disk2.vdi"
  
    config.vm.provider "virtualbox" do | vbox |
    
      vbox.memory = 2048
      vbox.cpus = 2
      
      unless File.exist?(node2_disk1)
        vbox.customize ['createhd', '--filename', node2_disk1, '--size', 10 * 1024]
        vbox.customize ['createhd', '--filename', node2_disk2, '--size', 10 * 1024]
      end
      vbox.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', node2_disk1]
      vbox.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', 2, '--device', 0, '--type', 'hdd', '--medium', node2_disk2]
    end
    
  end
  
  ## For masterless, mount your salt file root
  config.vm.synced_folder "salt/", "/srv/salt/"

  ## Use all the defaults:
  config.vm.provision :salt do |salt|

    salt.masterless = true
    salt.version = "2016.3.1"
    salt.minion_config = "salt/minion"
    salt.run_highstate = true

  end
  
end
