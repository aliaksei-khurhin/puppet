# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define "puppet-master" do | machine |
    machine.vm.box = "sbeliakou_centos-7.2-x86_64"
    machine.vm.hostname = "puppet-master"
    machine.vm.network :private_network, ip: "192.168.33.10"
    machine.vm.provider "virtualbox" do |vb|
      vb.name = machine.vm.hostname
      vb.memory = 4096
      vb.cpus = 2
    end
#    machine.vm.provision "shell", inline: <<-SHELL
#      rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-6.noarch.rpm
#      yum install -y puppetserver vim
#      echo "192.168.33.10    puppet-master puppet-master.minsk.epam.com" >> /etc/hosts
#      echo "192.168.33.15    puppet-node puppet-node.minsk.epam.com" >> /etc/hosts
#    SHELL
  end

  config.vm.define "puppet-node" do | machine |
    machine.vm.box = "sbeliakou_centos-7.2-x86_64"
    machine.vm.hostname = "puppet-node"
    machine.vm.network :private_network, ip: "192.168.33.15"
    machine.vm.provider "virtualbox" do |vb|
      vb.name = machine.vm.hostname
      vb.memory = "1024"
      vb.cpus = 1
    end
#    machine.vm.provision "shell", inline: <<-SHELL
#      rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-6.noarch.rpm
#      yum install -y puppet vim
#      echo "192.168.33.10    puppet-master puppet-master.minsk.epam.com" >> /etc/hosts
#      echo "192.168.33.15    puppet-node puppet-node.minsk.epam.com" >> /etc/hosts
#    SHELL
  end
end