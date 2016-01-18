include_recipe 'redisio::configure'

#Demarrage de tout les serveurs existants. Le nom du serveur est par defaut redis<num_port>

node['redisio']['servers'].each do |current_server|

    port = current_server['port']

    service "redis#{port}" do
          action :start
    end

end

