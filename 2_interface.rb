require 'date'
require 'json'

class Date
  def dayname
    DAYNAMES[self.wday]
  end

  def abbr_dayname
    ABBR_DAYNAMES[self.wday]
  end
end

# UI
puts 'Please select a day'
puts " - 'Monday'\n - 'Tuesday'\n - 'Wednesday'\n - 'Thursday'\n - 'Friday'\n - 'Saturday'\n - 'Sunday'"
day = gets.chomp.downcase

# STEP 1 EXTRACT MATCHES
matched = []
file = File.read('data.json')
data_hash = JSON.parse(file)
data_hash['data'].each do |row|
  dayname = Date.parse(row['timestamp']).dayname.downcase
  matched << row if dayname == day
end
puts "Extracted #{matched.size} out of #{data_hash['data'].size}"

# STEP 2 COUNT AND SORT MATCHES


