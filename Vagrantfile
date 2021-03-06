# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  # config.vm.box = "base"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL

  config.vm.define "c1" do |c1|
      c1.vm.hostname = "c1"
      c1.vm.box = "ubuntu/bionic64"
      c1.vm.network "private_network", virtualbox__intnet: "c1l1", auto_config: false
      c1.vm.provider "virtualbox" do |vbox|
          vbox.customize ['modifyvm', :id, '--nicpromisc2', 'allow-vms']
          vbox.customize ["modifyvm", :id, "--uart1", "0x3F8", "4"]
          vbox.customize ["modifyvm", :id, "--uartmode1", "file", File::NULL]
      end
      c1.vm.provision :ansible do |ansible|
          ansible.become = true
          ansible.playbook = 'verify.yml'
      end
  end
  config.vm.define "c2" do |c2|
      c2.vm.hostname = "c2"
      c2.vm.box = "ubuntu/bionic64"
      c2.vm.network "private_network", virtualbox__intnet: "c2l3", auto_config: false
      c2.vm.provider "virtualbox" do |vbox|
          vbox.customize ['modifyvm', :id, '--nicpromisc2', 'allow-vms']
          vbox.customize ["modifyvm", :id, "--uart1", "0x3F8", "4"]
          vbox.customize ["modifyvm", :id, "--uartmode1", "file", File::NULL]
      end
      c2.vm.provision :ansible do |ansible|
          ansible.become = true
          ansible.playbook = 'verify.yml'
      end
  end
  config.vm.define "l1" do |l1|
      l1.vm.hostname = "l1"
      l1.vm.box = "CumulusCommunity/cumulus-vx"
      l1.vm.network "private_network", virtualbox__intnet: "c1l1", auto_config: false
      l1.vm.network "private_network", virtualbox__intnet: "l1s1g1", auto_config: false
      l1.vm.network "private_network", virtualbox__intnet: "l1s2g1", auto_config: false
      l1.vm.provider "virtualbox" do |vbox|
          vbox.customize ['modifyvm', :id, '--nicpromisc2', 'allow-vms']
          vbox.customize ['modifyvm', :id, '--nicpromisc2', 'allow-vms']
          vbox.customize ['modifyvm', :id, '--nicpromisc2', 'allow-vms']
          vbox.customize ["modifyvm", :id, "--uart1", "0x3F8", "4"]
          vbox.customize ["modifyvm", :id, "--uartmode1", "file", File::NULL]
      end
      l1.vm.provision :ansible do |ansible|
          ansible.become = true
          ansible.playbook = 'verify.yml'
      end
  end
  config.vm.define "l3" do |l3|
      l3.vm.hostname = "l3"
      l3.vm.box = "CumulusCommunity/cumulus-vx"
      l3.vm.network "private_network", virtualbox__intnet: "c2l3", auto_config: false
      l3.vm.network "private_network", virtualbox__intnet: "l3s1g1", auto_config: false
      l3.vm.network "private_network", virtualbox__intnet: "l3s2g1", auto_config: false
      l3.vm.provider "virtualbox" do |vbox|
          vbox.customize ['modifyvm', :id, '--nicpromisc2', 'allow-vms']
          vbox.customize ['modifyvm', :id, '--nicpromisc2', 'allow-vms']
          vbox.customize ['modifyvm', :id, '--nicpromisc2', 'allow-vms']
          vbox.customize ["modifyvm", :id, "--uart1", "0x3F8", "4"]
          vbox.customize ["modifyvm", :id, "--uartmode1", "file", File::NULL]
      end
      l3.vm.provision :ansible do |ansible|
          ansible.become = true
          ansible.playbook = 'verify.yml'
      end
  end
  config.vm.define "s1g1" do |s1g1|
      s1g1.vm.hostname = "s1g1"
      s1g1.vm.box = "jghalam/sonic"
      s1g1.vm.network "private_network", virtualbox__intnet: "l1s1g1", auto_config: false
      s1g1.vm.network "private_network", virtualbox__intnet: "l3s1g1", auto_config: false
      s1g1.vm.provider "virtualbox" do |vbox|
          vbox.customize ['modifyvm', :id, '--nicpromisc2', 'allow-vms']
          vbox.customize ['modifyvm', :id, '--nicpromisc3', 'allow-vms']
          vbox.customize ["modifyvm", :id, "--uart1", "0x3F8", "4"]
          vbox.customize ["modifyvm", :id, "--uartmode1", "file", File::NULL]
      end
      s1g1.vm.provision :ansible do |ansible|
          ansible.become = true
          ansible.playbook = 'verify.yml'
      end
  end
  config.vm.define "s2g1" do |s2g1|
      s2g1.vm.hostname = "s2g1"
      s2g1.vm.box = "jghalam/sonic"
      s2g1.vm.network "private_network", virtualbox__intnet: "l1s2g1", auto_config: false
      s2g1.vm.network "private_network", virtualbox__intnet: "l3s2g1", auto_config: false
      s2g1.vm.provider "virtualbox" do |vbox|
          vbox.customize ['modifyvm', :id, '--nicpromisc2', 'allow-vms']
          vbox.customize ['modifyvm', :id, '--nicpromisc3', 'allow-vms']
          vbox.customize ["modifyvm", :id, "--uart1", "0x3F8", "4"]
          vbox.customize ["modifyvm", :id, "--uartmode1", "file", File::NULL]
      end
      s2g1.vm.provision :ansible do |ansible|
          ansible.become = true
          ansible.playbook = 'verify.yml'
      end
  end
end
