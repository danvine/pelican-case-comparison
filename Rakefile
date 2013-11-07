require './lib/pelican/extract'
require './lib/pelican/scad-layout'

desc "Cache Pelican Case Sizes from http://www.pelican-case.com/chart.html"
task :cache do
  `curl -s 'http://www.pelican-case.com/chart.html' > ./cache/all.html`
end

desc "Generate Scad File"
task :generate_scad do
  scad = Pelican::scad_layout
  File.open('./cache/all.scad', 'w') { |file| file.write(scad) }

  puts "Ok, scad file created."
  puts "I will now attempt to launch openscad for you."
  puts "1. Render (F6)"
  puts "2. Design > Export as STL to ./public/stl/all.stl"
  puts "3. Generate binary STL with: rake generate_binary_stl"
  puts "Press any key to continue."
  STDIN.gets.chomp
  `open ./cache/all.scad`
end

desc "Generate Binary STL from ASCII STL"
task :generate_binary_stl do
	`bundle exec ruby bin/convertSTL.rb public/stl/all.stl`
end