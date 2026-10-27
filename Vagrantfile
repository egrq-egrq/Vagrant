# -*- mode: ruby -*-
# vi: set ft=ruby :

BASE_BOX_IMAGE    = "oraclelinux9-arm64-vbox"
BASE_BOX_URL      = "https://yum.oracle.com/boxes/oraclelinux/ol9-aarch64/OL9U8_aarch64-vagrant-virtualbox-b184.box"
BASE_BOX_CHECKSUM = "ff560263923bf95701a8be307e1f4b4911f5befd0e7197079874512b5eac621f"

BASE_IP           = "192.168.56."
NODE_COUNT        = 1
NODE_MEMORY       = 4096
NODE_CPUS         = 2

Vagrant.configure("2") do |config|
  config.vm.box         = BASE_BOX_IMAGE
  config.vm.box_url     = BASE_BOX_URL
  config.vm.box_check_update = false

  config.vm.box_download_checksum_type = "sha256"
  config.vm.box_download_checksum      = BASE_BOX_CHECKSUM

  (1..NODE_COUNT).each do |i|
    config.vm.define "node-#{i}" do |node|
      node.vm.hostname = "node-#{i}"

      node.vm.network :private_network,
                      ip: "#{BASE_IP}#{100 + i}"

      node.vm.provision "shell", inline: <<-SHELL
        echo "=================================================="
        echo "  VAGRANT NODE IS UP AND CONFIGURED"
        echo "--------------------------------------------------"
        echo "  Hostname : node-#{i}"
        echo "  IP       : #{BASE_IP}#{100 + i}"
        echo "  Time     : $(TZ='Europe/Moscow' date)"
        echo "=================================================="
      SHELL

      node.vm.provider "virtualbox" do |vb|
        vb.gui    = false
        vb.memory = NODE_MEMORY
        vb.cpus   = NODE_CPUS
      end
    end
  end
end