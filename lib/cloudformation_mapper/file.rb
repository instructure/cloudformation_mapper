require 'cloudformation_mapper'
require 'cloudformation_mapper/template'

module CloudformationMapper::File
  def self.load file
    Class.new CloudformationMapper::Template do
      instance_eval open(file).read, file
    end
  end
end
