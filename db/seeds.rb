
unless Rails.env.production?
    connection = ActiveRecord::Base.connection

  
    sql = File.read('db/sakila-data.sql')
    statements = sql.split(/;$/)
    statements.pop
  
    ActiveRecord::Base.transaction do
      statements.each do |statement|
        connection.execute(statement)
      end
    end
  end