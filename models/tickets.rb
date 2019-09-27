require_relative("customers")
require_relative("films")
require_relative("../db/sql_runner")

class Ticket

  attr_reader :id, :customer_id, :film_id

  def initialize(options)
    @id = options['id'].to_i if options ['id']
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
  end

  def save()
    sql = "INSERT INTO tickets (customer_id, film_id) VALUES ($1, $2) RETURNING id"
    values = [@customer_id, @film_id]
    film = SqlRunner.run(sql, values)[0];
    @id = film['id'].to_i
  end

  def update()
    sql = "UPDATE tickets SET (customer_id, film_id) = ($1, $2) WHERE id = $3"
    values = [@customer_id, @film_id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM tickets where id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def customer()
    sql = "SELECT * FROM customers where id = $1"
    values = [@customer_id]
    customer = SqlRunner.run(sql, values)[0]
    return Customer.new(customer)
  end

  def film()
    sql = "SELECT * FROM films WHERE id = $1"
    values = [@film_id]
    film = SqlRunner.run(sql, values)[0]
    return Film.new(film)
  end

  def self.all()
    sql = "SELECT * FROM tickets"
    all_tickets = SqlRunner.run(sql)
    return Ticket.map_items(all_tickets)
  end

  def self.delete_all()
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end

  def self.map_items(ticket_hashes)
    result = ticket_hashes.map{ |ticket_hash| Ticket.new(ticket_hash)}
    return result
  end

end
