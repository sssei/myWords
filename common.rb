require 'active_record'
require 'nokogiri'

dbname = 'my_words'
host = '127.0.0.1'
user = 'root'
pass = ''

ActiveRecord::Base.logger = Logger.new(STDERR)

ActiveRecord::Base.establish_connection(
  :adapter   => 'mysql2',
  :database  => dbname,
  :host      => host,
  :username  => user,
  :password  => pass,
  :charset   => 'utf8mb4',
  :encoding  => 'utf8mb4',
  :collation => 'utf8mb4_general_ci'
)
