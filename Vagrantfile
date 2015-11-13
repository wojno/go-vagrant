# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.ssh.forward_agent = true

  config.vm.define :go do |go|
    go.vm.box = "precise-server"

    go.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box"

    go.vm.synced_folder "./manifests", "/etc/puppet/manifests"
    go.vm.synced_folder "./modules",   "/etc/puppet/modules"

    go.vm.provision :puppet do |puppet|
      puppet.manifests_path = "manifests"
      puppet.manifest_file  = "vagrant.pp"
    end

    go.vm.provider :virtualbox do |vb|
      vb.name = "Go Vagrant"
      vb.customize ["modifyvm", :id, "--memory", "1024"]
      vb.customize ["modifyvm", :id, "--cpus",      "1"]
    end
  end
end
