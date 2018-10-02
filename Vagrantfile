# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.box = 'ubuntu/bionic64'
  config.vm.network 'forwarded_port', guest: 4000, host: 4000
  config.vm.provider 'virtualbox' do |vb|
    vb.memory = 1024
    vb.cpus = 2
  end
  config.vm.provision :ansible_local do |ansible|
    ansible.provisioning_path = '/vagrant/provisioning'
    ansible.galaxy_role_file  = 'requirements.yml'
    ansible.galaxy_roles_path = 'roles/'
    ansible.playbook          = 'main.yml'
    ansible.verbose           = true
    ansible.limit             = 'local'
    ansible.inventory_path    = 'inventory/local.ini'
  end
end
