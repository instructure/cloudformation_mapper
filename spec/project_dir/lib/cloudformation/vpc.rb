class VpcId < CloudformationMapper::Mapper
  type 'String'
  description 'The id of the VPC to launch into.'

  def self.prompt sofar
    prompt = "Select target VPC?"

    vpcs = Aws::EC2::Resource.new.vpcs

    choose do |menu|
      menu.index        = :letter
      menu.index_suffix = ") "

      menu.header = prompt

      vpcs.each do |vpc|
        name = vpc.tags.find(->{Struct.new(:value).new('')}){|t| t.key == "Name"}.value
        menu.choice "#{name} (#{vpc.id})" do
          vpc
        end
      end
    end
  end
end

class ParameterSubnetListMapper < CloudformationMapper::Mapper
  def self.prompt sofar
    vpc = sofar['VpcId']
    subnets = vpc.subnets

    choose do |menu|
      menu.index        = :letter
      menu.index_suffix = ") "

      menu.header = @prompt

      subnets.sort do |a, b|
        a = a.tags.find(->{Struct.new(:value).new('')}){|t| t.key == "Name"}.value
        b = b.tags.find(->{Struct.new(:value).new('')}){|t| t.key == "Name"}.value

        a <=> b
      end.each do |subnet|
        name = subnet.tags.find(->{Struct.new(:value).new('')}){|t| t.key == "Name"}.value
        menu.choice "#{name} (#{subnet.id})" do
          subnet
        end
      end

      def menu.valid_answer? string
        string.split(/\s*,?\s*/).all? do |answer|
          super answer
        end
      end

      def menu.in_range? string
        string.split(/\s*,?\s*/).all? do |answer|
          super answer
        end
      end

      def menu.convert string
        string.split(/\s*,?\s*/).map do |answer|
          super answer
        end.join(', ')
      end

      def menu.select highline_context, string, details = nil
        string.split(/\s*,?\s*/).map do |answer|
          super highline_context, answer, details
        end
      end
    end.map{|o| o.id}.join(', ')
  end
end

class VpcSubnets < ParameterSubnetListMapper
  type 'CommaDelimitedList'
  description 'The list of VPC subnets to launch resources into.'

  @prompt = "Select target VPC Private Subnets"
end

class VpcElbSubnets < ParameterSubnetListMapper
  type 'CommaDelimitedList'
  description 'The list of VPC subnets for public-facing ELBs to launch into.'

  @prompt = "Select target VPC ELB (Public) Subnets"
end

class VpcSecurityGroup < CloudformationMapper::Mapper
  type 'String'
  description 'VPC wide security group.'

  def self.prompt sofar
    prompt = "Select VPC security group"

    vpc = sofar['VpcId']
    security_groups = vpc.security_groups


    choose do |menu|
      menu.index        = :letter
      menu.index_suffix = ") "

      menu.header = prompt

      security_groups.each do |sg|
        name = sg.tags.find(->{Struct.new(:value).new('')}){|t| t.key == "Name"}.value

        menu.choice "#{name} - #{sg.group_name} (#{sg.id})" do
          sg
        end
      end
    end
  end
end
