require 'cloudformation_mapper/template'

RSpec.describe CloudformationMapper::Template do
  context 'class' do
    subject do
      Class.new CloudformationMapper::Mapper do
        type 'Template'
      end
    end

    # Template attributes
    it {should respond_to(:name)}
    it {should respond_to(:description)}

    # Template collections
    it {should respond_to(:parameters)}
    it {should respond_to(:mappings)}
    it {should respond_to(:conditions)}
    it {should respond_to(:resources)}
    it {should respond_to(:outputs)}
  end
end
