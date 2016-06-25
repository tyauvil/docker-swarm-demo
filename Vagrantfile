# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/xenial64"
  
  disk = "disk.vdi"
  
  config.vm.provider "virtualbox" do | vbox |
    unless File.exist?(disk)
      vbox.customize ['createhd', '--filename', disk, '--size', 10 * 1024]
    end
    vbox.customize ['storageattach', :id, '--storagectl', 'SCSI Controller', '--port', 3, '--device', 0, '--type', 'hdd', '--medium', disk]
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
