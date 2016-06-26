# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "boxcutter/ubuntu1604"

  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end
  
  config.vm.define :"manager-1" do |manager|

    manager.vm.hostname = "manager-1"
    manager.vm.network :private_network, ip: "192.168.50.10"
    manager.vm.provider "virtualbox" do | vbox |
    
      vbox.memory = 1024
      vbox.cpus = 1
      
    end
  end
  
  (1..2).each do |i|
  
     config.vm.define :"worker-#{i}" do |worker|

      worker.vm.hostname = "worker-#{i}"
      worker.vm.network :private_network, ip: "192.168.50.1#{i}"
      worker.vm.provider "virtualbox" do | vbox |
    
        vbox.memory = 3072
        vbox.cpus = 2
      
      end
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
