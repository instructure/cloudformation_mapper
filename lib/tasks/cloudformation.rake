require 'highline/import'
require 'aws-sdk'

require 'cloudformation_mapper'
require 'cloudformation_mapper/directory'

namespace :cloudformation do
  desc 'Generate Cloudformation template'
  task :generate do
    template = CloudformationMapper::Directory.load './'

    puts JSON.pretty_generate(JSON.parse template.to_json)
  end

  desc 'Build CloudFormation stack'
  task :build, :stack_name do |t, args|
    stack_name = args[:stack_name] || ask("Stack name? ")

    template = CloudformationMapper::Directory.load('./')#.new(stack_name)

    parameters = template.parameters.inject({}) do |answers, (key, param)|
      answers[key] = param.prompt answers
      answers
    end.inject([]) do |result, (key, answer)|
      result << {
        parameter_key: key,
        parameter_value: answer.respond_to?(:id) ? answer.id.to_s : answer.to_s
      }
    end

    cf = Aws::CloudFormation::Resource.new

    stack = cf.create_stack(
      stack_name: stack_name,
      template_body: template.to_json,
      parameters: parameters,
      capabilities: ['CAPABILITY_IAM']
    )
    puts

    TABLE_FORMAT = '%-25s%-60s%-40s%-20s'
    puts TABLE_FORMAT % ['Status', 'Type', 'Logical ID', 'Reason']

    latest_event = nil

    stack.events.reverse_each do |event|
      latest_event = event
      puts TABLE_FORMAT % [event.resource_status, event.resource_type, event.logical_resource_id, event.resource_status_reason]
    end

    begin
      sleep 1

      stack = cf.stack(stack.name)

      stack.events.take_while do |event|
        event.event_id != latest_event.event_id
      end.reverse_each do |event|
        latest_event = event
        puts TABLE_FORMAT % [event.resource_status, event.resource_type, event.logical_resource_id, event.resource_status_reason]
      end
    end until stack.stack_status != 'CREATE_IN_PROGRESS'
  end

  desc 'Update CloudFormation stack'
  task :update, :stack_name do |t, args|
    stack_name = args[:stack_name] || ask("Stack name? ")
  end
end
