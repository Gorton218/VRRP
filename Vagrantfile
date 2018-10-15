Vagrant.configure('2') do |config|
  config.vm.box = 'centos/7'
  config.vm.box_check_update = false

  config.vm.provider 'virtualbox' do |vb|
    vb.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
    vb.customize ['modifyvm', :id, '--natdnsproxy1', 'on']
    vb.memory = '256'
  end

  config.vm.define 'server1' do |server1|
    server1.vm.network 'private_network', ip: '192.168.55.50'
    server1.vm.provision 'shell', inline: 'bash /vagrant/provision.sh server1 100'
  end

  config.vm.define 'server2' do |server2|
    server2.vm.network 'private_network', ip: '192.168.55.51'
    server2.vm.provision 'shell', inline: 'bash /vagrant/provision.sh server2 150'
  end

  config.vm.define 'client' do |client|
    client.vm.network 'private_network', ip: '192.168.55.53'
    client.vm.provision 'shell', inline: 'yum install -y tmux'
  end
end
