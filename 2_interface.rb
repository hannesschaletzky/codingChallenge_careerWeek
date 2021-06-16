require 'date'
require 'json'

class Date
  def dayname
    DAYNAMES[wday]
  end
end

# UI
puts 'Please select a day'
puts " - 'Monday'\n - 'Tuesday'\n - 'Wednesday'\n - 'Thursday'\n - 'Friday'\n - 'Saturday'\n - 'Sunday'"
day = gets.chomp.downcase

# STEP 1 - EXTRACT MATCHES
matched = []
file = File.read('data.json')
data_hash = JSON.parse(file)
data_hash['data'].each do |row|
  dayname = Date.parse(row['timestamp']).dayname.downcase
  matched << row if dayname == day
end
puts "Extracted #{matched.size} out of #{data_hash['data'].size}"

# STEP 2 - COUNT AND SORT MATCHES
ranking = {}
matched.each do |obj|
  if ranking[obj['id']].nil?
    ranking[obj['id']] = 0
  else
    ranking[obj['id']] += 1
  end
end
ranking = ranking.sort_by { |_, v| -v }

# STEP 3 - DISPLAY RESULTS
ranking.take(10).each do |obj|
  p obj
end
