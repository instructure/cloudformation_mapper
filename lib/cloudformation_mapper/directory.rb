require 'cloudformation_mapper'
require 'cloudformation_mapper/file'

module CloudformationMapper::Directory
  def self.load path
    file = File.join(path, 'Cloudformation')
    CloudformationMapper::File.load file
  end
end
