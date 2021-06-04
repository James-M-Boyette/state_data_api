# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"

# csv_text_data = File.read(Rails.root.join("lib", "seeds", "state_data.csv"))
# puts csv_text_data

# puts csv_text_abrv            ## Turn this on to see the raw text of the CSV (& verify you're accessing it at all/properly)

# csv_text_abrv = File.read(Rails.root.join("lib", "seeds", "abbreviations.csv"))
# csv = CSV.parse(File.read("csv_text_abrv"), :headers => true)

# >> Rails.root
# => #<Pathname:/some/path/to/project>
# >> Rails.root + "file"
# => #<Pathname:/some/path/to/project/file>
# >> Rails.root + "/file"
# => #<Pathname:/file>
# >> Rails.root.join "file"
# => #<Pathname:/some/path/to/project/file>
# >> Rails.root.join "/file"
# => #<Pathname:/file>

table = CSV.parse(File.read(Rails.root.join("lib", "seeds", "abbreviations.csv")), headers: true)               # Fix v.1
i = 0

table.each do |row| # For each row of the csv ...
  # puts row.to_hash            ## Turn this on to see the rows of the rows of the CSV as hashed K:Vs
  # t.state = row["State"]        # this is returning 'nil', though the column can be read properly in other ways ... ??
  t = Abbreviation.new
  states = table.by_col[0]
  t.state = states[i]
  i += 1
  t.abbrev = row["Abbrev"]
  t.code = row["Code"]
  t.save
  puts "#{t.state}, #{t.abbrev}, #{t.code} saved"
end

puts "There are now #{Abbreviation.count} rows in the abbreviations table"

table2 = CSV.parse(File.read(Rails.root.join("lib", "seeds", "state_data.csv")), headers: true)               # Fix v.1
i = 0

table2.each do |row| # For each row of the csv ...
  # puts row.to_hash            ## Turn this on to see the rows of the rows of the CSV as hashed K:Vs
  # t.state = row["State"]        # this is returning 'nil', though the column can be read properly in other ways ... ??
  # t.state = row["State"]
  t = State.new
  states = table2.by_col[0]
  t.state = states[i]
  i += 1
  t.median_household_income = row["median_household_income"]
  t.share_unemployed_seasonal = row["share_unemployed_seasonal"]
  t.share_population_in_metro_areas = row["share_population_in_metro_areas"]
  t.share_population_with_high_school_degree = row["share_population_with_high_school_degree"]
  t.save
  puts "#{t.state}, #{t.median_household_income}, #{t.share_unemployed_seasonal} #{t.share_population_in_metro_areas}, #{t.share_population_with_high_school_degree}, saved"
end

puts "There are now #{State.count} rows in the states table"
