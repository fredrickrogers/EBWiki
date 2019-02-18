# frozen_string_literal: true

VAGRANTFILE_API_VERSION = '2'

guest_ip = '192.168.68.68'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = 'ebwiki/dev'

  config.vm.define 'ebwiki-dev' do |host|
    host.vm.hostname = 'ebwiki-dev.local'
    host.vm.provision 'shell', path: 'dev_provisions/dbuser.sh'
    host.vm.provision 'shell', path: 'provision.sh', privileged: false
    host.vm.network 'private_network', ip: "#{guest_ip}"
    host.vm.network 'forwarded_port', guest: '80', host: '3000'

    host.vm.provider 'virtualbox' do |v|
      v.memory = '2024'
      v.cpus = '1'
      v.name = 'EBWiki Server'
    end
  end
end

puts '-------------------------------------------------'
puts ' Project URL : http://localhost:3000'
puts '-------------------------------------------------'
