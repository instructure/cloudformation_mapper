spec = Gem::Specification.find_by_name 'cloudformation_mapper'
Dir["#{spec.gem_dir}/lib/tasks/*.rake"].sort.each{|f| load f}

ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.acronym 'DB'
  inflect.acronym 'SQL'
  inflect.acronym 'EC2'
  inflect.acronym 'API'
end
