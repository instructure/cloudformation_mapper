require 'active_support/concern'

require 'cloudformation_mapper'
require 'cloudformation_mapper/dsl_attribute_methods'

class CloudformationMapper::Resource < CloudformationMapper::Mapper
  type 'Template'

  parameter do
    type 'Template'
    name :Properties
  end
end
