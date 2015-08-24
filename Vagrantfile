# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = "jessie-salt-masterless-vbox-vagrant.box"
  config.vm.synced_folder "salt/roots/", "/srv/"

  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end

  # use shell provisioner as the basebox already has salt installed and 
  # Vagrant releases > 1.7.2 has functionality regressions with the Salt
  # provisioner. This results in a salt-masterless run.
  config.vm.provision "shell", inline: <<-SHELL
    sudo cp /vagrant/salt/minion /etc/salt/minion.d/minion.conf
    sudo salt-call state.highstate
  SHELL
  
end
