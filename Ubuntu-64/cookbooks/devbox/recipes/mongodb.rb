include_recipe 'mongodb3::default'

service "mongod" do
  action :start
end