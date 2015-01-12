require 'cloudformation_mapper/resource'
my_dir = File.dirname(__FILE__)
(Dir[File.join(my_dir, '*.rb')] - [File.join(my_dir, 'all.rb')]).each {|file| require file }
