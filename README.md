# Aprova Redação

* Ruby ruby 2.7.6p219
* Rails 7.0.8.6
* PostgreSQL
* Front-end HTML, CSS, e JS
* Gems Principais: Rspec, Puma, StateMachine, Stripe, Devise

# Subir o server: http://localhost:3000
   docker-compose run --service-ports web
# Subir console:
   docker-compose run web rails c
# Obter permissão nas migrations ou arquivos gerados:
   sudo chown -R $(whoami):$(whoami) /home/cprieto/projects/caioprieto/calculate-freight/freight_calculate_api
# Criar admin - Rodar no console
   Admin.create(email: "aprovaredacao@gmail.com", password: "123321")
