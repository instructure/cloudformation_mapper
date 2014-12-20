require 'cloudformation_mapper'

module CloudformationMapper::File
  def self.load file
    Class.new CloudformationMapper::Mapper do
      instance_eval open(file).read, file
    end
  end
end
