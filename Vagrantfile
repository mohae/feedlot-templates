# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = "vagrant.box"
  config.vm.synced_folder "salt/roots/", "/srv/"

  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end

  # salt-masterless  	
  config.vm.provision :salt do |salt|
    salt.bootstrap_options = "-P -c /tmp"
	salt.minion_config = "salt/minion"
	salt.run_highstate = true
	salt.log_level = "warning"
  end
end
