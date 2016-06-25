# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "boxcutter/ubuntu1604"
  
  disk = "disk.vdi"
  
  config.vm.provider "virtualbox" do | vbox |
    unless File.exist?(disk)
      vbox.customize ['createhd', '--filename', disk, '--size', 10 * 1024]
      #vbox.customize ["storagectl", :id, "--name", "SCSI controller", "--add", "scsi"]
    end
    vbox.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', disk]
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
