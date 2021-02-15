=begin

  Allan Alexander
  12:23 pm
  Thursday 13th February 2021

  Topic: Postgres DB
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
