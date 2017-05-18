desc 'Imports a CSV file into the `students` Active Record table'
task :student_import, [:filename,:model] => [:environment] do |task,args|
  lines = File.new(args[:filename], "r:ISO-8859-1").readlines
  header = lines.shift.strip
  keys = header.split(',')
  lines.each do |line|
    values = line.strip.split(',')
    attributes = Hash[keys.zip values]
    Module.const_get(args[:model]).create(attributes)
  end
end