# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # config.vm.box = "centos/7"
  #
  # La box officielle de Centos 7 ne dispose pas des Virtualbox Guest Additions
  # permettant de synchroniser les dossiers (Synced Folder).
  # [VirtualBox Guest Additions in Vagrant image #27](https://github.com/CentOS/sig-cloud-instance-build/issues/27)
  config.vm.box = "geerlingguy/centos7"
  config.vm.network "forwarded_port", guest: 8080, host: 8080

  config.vm.provision "shell", privileged: false, inline: "mkdir ~/youtrack"

  # Installation de Docker
  config.vm.provision "docker" do |d|
    d.build_image "/vagrant",
      args: "-t sebmartin/youtrack"

    d.run "sebmartin/youtrack",
      # http://stackoverflow.com/questions/26021181/not-enough-entropy-to-support-dev-random-in-docker-containers-running-in-boot2d
      args: "--name youtrack -v /dev/urandom:/dev/random -v /home/vagrant/youtrack:/var/lib/youtrack -p 8080:8080 -d"
  end

  # config.vm.provision "shell", inline: "docker create -v /home/youtrack --name youtrack-data sebmartin/youtrack"

  # http://stackoverflow.com/questions/26021181/not-enough-entropy-to-support-dev-random-in-docker-containers-running-in-boot2d
  # config.vm.provision "shell", inline: "docker run -v /dev/urandom:/dev/random --volumes-from youtrack-data --name youtrack-app -p 8080:8080 -d sebmartin/youtrack"
end
