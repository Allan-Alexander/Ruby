=begin

  Allan Alexander
  6:53 pm
  Saturday 13th February 2021

  Topic: Postgres DB Assignment
  Important:

=end

require 'active_record'

def connect_db!
  ActiveRecord::Base.establish_connection(
    host: 'localhost',
    adapter: 'postgresql',
    database: 'saas_db',
    user: 'postgres',
    password: 'changeme'
  )
end
