role :app, %w{deploy@tripmustsees.com}
role :web, %w{deploy@tripmustsees.com}
role :db,  %w{deploy@tripmustsees.com}

server 'tripmustsees.com', user: 'deploy', roles: %w{web app}
