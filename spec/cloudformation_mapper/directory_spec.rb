require 'cloudformation_mapper/directory'

RSpec.describe CloudformationMapper::Directory do
  let(:directory){File.join('spec', 'project_dir')}

  describe '.load' do
    subject{CloudformationMapper::Directory.load(directory)}

    it 'should load the template described by the given directory' do
      expect(subject.ancestors).to include(CloudformationMapper::Template)
    end
  end
end
