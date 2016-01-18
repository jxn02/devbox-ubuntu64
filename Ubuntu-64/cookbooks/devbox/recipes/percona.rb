include_recipe 'percona::default'
include_recipe 'percona::server'


    template '/etc/mysql/create_db.sql' do
      source 'percona/create_db.sql.erb'
      mode '0755'
      owner node['devbox']['user']
      group node['devbox']['group']
        variables({
           :database_name => node["database"]["dbname"]
        })
    end

     execute "mysql-create-db" do
        command "/usr/bin/mysql < /etc/mysql/create_db.sql"
      end

    template '/etc/mysql/create_user.sql' do
    source 'percona/create_user.sql.erb'
    mode '0755'
    owner node['devbox']['user']
    group node['devbox']['group']
      variables({
         :username => node["database"]["username"],
         :password => node["database"]["password"]
      })
  end

   execute "mysql-create-user" do
      command "/usr/bin/mysql < /etc/mysql/create_user.sql"
    end
