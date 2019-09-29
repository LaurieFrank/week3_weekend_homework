require_relative('models/customers')
require_relative('models/films')
require_relative('models/tickets')

require('pry')

Film.delete_all()
Customer.delete_all()
Ticket.delete_all()

customer1 = Customer.new({
  'name' => "David Gordon",
  'funds' => 250
  })

customer2 = Customer.new({
  'name' => 'Sally French',
  'funds' => 190
  })

customer3 = Customer.new({
  'name' => 'Fred McNeil',
  'funds' => 200
  })
customer1.save()
customer2.save()
customer3.save()


film1 = Film.new({
  'title' => 'The Way',
  'price' => 12
  })

film2 = Film.new({
  'title' => 'The Shining',
  'price' => 10
  })
film1.save()
film2.save()


ticket1 = Ticket.new({
  'customer_id' => customer1.id,
  'film_id' => film1.id
  })

ticket2 = Ticket.new({
  'customer_id' => customer2.id,
  'film_id' => film1.id
  })

ticket3 = Ticket.new({
  'customer_id' => customer3.id,
  'film_id' => film1.id
  })

ticket4 = Ticket.new({
  'customer_id' => customer3.id,
  'film_id' => film2.id
  })

ticket5 = Ticket.new({
  'customer_id' => customer1.id,
  'film_id' => film2.id
  })

ticket1.save()
ticket2.save()
ticket3.save()
ticket4.save()
ticket5.save()

# ticket1.customer
# film1.title
# customer1.name
# customer1.funds
# ticket1.delete()
# customer1.update() can't remember how to do this

# customer1.films
# films.customers #not sure how to return customer name? ticket1.film.name
doesn't recognise name

binding.pry
nil
