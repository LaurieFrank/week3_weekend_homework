require_relative('models/customers')
require_relative('models/films')
require_relative('models/tickets')

require('pry')

customer1 = Customer.new({
  'name' => "David Gordon",
  'funds' => 250
  })

customer2 = Customer.new({
  'name' => 'Sally French',
  'funds' => 190
  })

customer3 = Customer.new({
  'name' => 'Fred McNeil'
  'funds' => 200
  })


film1 = Film.new({
  'title' => 'The Way'
  'price' => 12
  })

film2 = Film.new({
  'title' => 'The Shining'
  'price' => 10
  })


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
