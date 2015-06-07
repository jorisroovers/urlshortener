VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/trusty64"
  config.vm.network :forwarded_port, guest: 6379, host: 6379

  config.vm.provider :virtualbox do |vbox|
    vbox.customize ["modifyvm", :id, "--memory", 1024]
  end

  config.vm.provision "shell", inline: "echo 'cd /vagrant' >> /home/vagrant/.bashrc"
  config.vm.provision "shell", path: "install_redis.sh"
  config.vm.provision "shell", inline: "cd /vagrant && ./install_app.sh"

end