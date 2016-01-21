require 'yaml'
params = YAML::load_file("/vagrant/config.yml")

# Autorise le user à utiliser les crons

cron_manage '#{params["user"]["name"]}' do
  user   params['user']['name']
  action :allow
end

# Crée les tâches crons assignées au user (enregistrées dans /etc/cron.d)

params['crons'].each do |cron_task|

    cron_d cron_task["cron"]["name"] do
          minute  cron_task['cron']['minute']
          hour    cron_task['cron']['hour']
          day     cron_task['cron']['day']
          month   cron_task['cron']['month']
          weekday cron_task['cron']['weekday']
          command cron_task['cron']['command']
          user    params['user']['name']
          mailto  cron_task['cron']['mailto']
    end

end