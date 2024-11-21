require 'fileutils'

# Prompt user for the folder path and destination file
puts "Enter the path of the folder you want to compress:"
folder_path = gets.chomp.strip

puts "Enter the name of the output .tar.bz2 file (e.g., archive.tar.bz2):"
output_file = gets.chomp.strip

# Validate folder path
if !Dir.exist?(folder_path)
  puts "Error: The folder '#{folder_path}' does not exist."
  exit
end

# Ensure the output file ends with .tar.bz2
output_file += ".tar.bz2" unless output_file.end_with?(".tar.bz2")

# Run the compression command
begin
  # Get absolute paths for safety
  folder_absolute_path = File.expand_path(folder_path)
  output_absolute_path = File.expand_path(output_file)

  # Construct the tar.bz2 command
  command = "tar -cjf #{output_absolute_path} -C #{File.dirname(folder_absolute_path)} #{File.basename(folder_absolute_path)}"
  
  puts "Compressing folder..."
  system(command)

  if $?.success?
    puts "Compression complete! File saved as: #{output_absolute_path}"
  else
    puts "Error: Compression failed. Please check your inputs and try again."
  end
rescue => e
  puts "An error occurred: #{e.message}"
end
