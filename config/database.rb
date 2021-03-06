require 'sinatra/activerecord'

def self.connect_to_database
  begin
    ActiveRecord::Base.establish_connection(
      :adapter  => "mysql2",
      :host     => "#{ENV["DATABASE_SERVICE_HOST"]}",
      :port     => "#{ENV["DATABASE_SERVICE_PORT"]}",
      :database => "#{ENV["MYSQL_DATABASE"]}",
      :password => "#{ENV["MYSQL_ROOT_PASSWORD"]}"
    )

    ActiveRecord::Base.connection.active?

  rescue Exception
    return false
  end
end
