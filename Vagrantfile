# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  
  #VARS
  #PROXY_URL = "http://10.0.2.2:5865" #px-py
  PROXY_URL = "http://10.20.5.51:8888" #shhh, secret proxy. don't tell to the boss! don't be sus
  PROXY_ENABLE = true
  BASE_INT_NETWORK = "10.10.20"
  BASE_HOST_ONLY_NETWORK = "192.168.56"
  BOX_IMAGE = "ubuntu/jammy64"

  config.vm.define "web" do |subconfig|
    subconfig.vm.box = BOX_IMAGE
    subconfig.vm.hostname = "web.m340"

    subconfig.vm.network "private_network", ip: "#{BASE_HOST_ONLY_NETWORK}.10"
    subconfig.vm.network "private_network", ip: "#{BASE_INT_NETWORK}.10", virtualbox__intnet: "intnet"

    subconfig.vm.synced_folder "./www", "/var/www/html"

    if Vagrant.has_plugin?("vagrant-proxyconf") && PROXY_ENABLE
      subconfig.proxy.http     = PROXY_URL
      subconfig.proxy.https    = PROXY_URL
      subconfig.proxy.no_proxy = "localhost,127.0.0.1"
    end

    subconfig.vm.provision "shell", path: "./scripts/web_provision.sh"
  end

  config.vm.define "db" do |subconfig|
    subconfig.vm.box = BOX_IMAGE
    subconfig.vm.hostname = "db.340"

    subconfig.vm.network "private_network", ip: "#{BASE_INT_NETWORK}.11", virtualbox__intnet: "intnet"

    subconfig.vm.synced_folder "./www/application/config", "/home/vagrant/dbConfig"

    if Vagrant.has_plugin?("vagrant-proxyconf") && PROXY_ENABLE
      subconfig.proxy.http     = PROXY_URL
      subconfig.proxy.https    = PROXY_URL
      subconfig.proxy.no_proxy = "localhost,127.0.0.1"
    end

    subconfig.vm.provision "shell", path: "./scripts/db_provision.sh"
  end
  
end
