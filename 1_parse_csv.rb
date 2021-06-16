require 'csv'
require 'json'

# STEP 1
# Reading from CSV and storing in JSON as objects
puts 'Parsing the CSV...'

arr = []
CSV.foreach('report.csv', headers: true) do |row|
  arr.push({
            'timestamp': row['timestamp'],
            'id': row['id'],
            'type': row['type'],
            'status': row['status']
  })
end

File.open('data.json', 'wb') do |file|
  file.write(JSON.generate({ data: arr }))
end
