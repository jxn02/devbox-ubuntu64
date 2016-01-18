include_recipe 'mailhog'

runit_service "mailhog" do
    env "MH_STORAGE" => "mongodb"
end