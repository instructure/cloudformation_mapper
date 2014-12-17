require 'cloudformation_mapper/mapper'

RSpec.describe CloudformationMapper::Mapper do
  context 'class methods' do
    subject do
      Class.new CloudformationMapper::Mapper do
        name 'TestMapper'
      end
    end

    describe '.method_missing' do
      before :each do
        allow(subject).to receive(:allow_unknown_attributes?).and_return(allow_unknown_attributes)
      end

      context 'when .allow_unknown_attributes? is true' do
        let(:allow_unknown_attributes){true}

        let(:arg_1){:arg_1}
        let(:arg_2){:arg_2}

        it 'should camelize the method to generate the attribute key and delegate to .handle_unknown_attribute' do
          expect(subject).to receive(:handle_unknown_attribute).with(:CamelCaseString, arg_1, arg_2)
          subject.camel_case_string arg_1, arg_2
        end

        context 'with a block' do
          let(:result) do
            subject.any_attribute arg_1, arg_2 do |*args|
              @args = args
              class << self
                def assert_result
                  [true] + @args
                end
              end
            end
          end

          it 'should execute the block within the context of a new CloudformationMapper::Mapper Class' do
            expect(result).to respond_to(:assert_result)
            expect(result.ancestors).to include(CloudformationMapper::Mapper)
          end

          it 'should pass along any arguments' do
            expect(result.assert_result).to contain_exactly(true, arg_1, arg_2)
          end

          it 'should store the resulting CloudformationMapper::Mapper Class as the attribute\'s value' do
            expect(result).to be(subject[:AnyAttribute])
          end
        end

        context 'with one argument' do
          before :each do
            subject.any_attribute(arg_1)
          end

          it 'should store the argument as the attribute\'s value' do
            expect(subject[:AnyAttribute]).to be(arg_1)
          end
        end

        context 'with more than one argument' do
          before :each do
            subject.any_attribute(arg_1, arg_2)
          end

          it 'should store the array of arguments as the attribute\'s value' do
            expect(subject[:AnyAttribute]).to contain_exactly(arg_1, arg_2)
          end
        end

        context 'with no arguments' do
          context 'and an attribute that has been set' do
            before :each do
              subject.any_attribute(arg_1)
            end

            it 'should return the value stored for the attribute' do
              expect(subject.any_attribute).to be(arg_1)
            end
          end

          context 'and an attribute that has not been set' do
            it 'should return a Fn::GetAtt clause for the requested attribute' do
              expect(subject.any_attribute).to eql(:"Fn::GetAtt" => ['TestMapper', :AnyAttribute])
            end
          end
        end
      end

      context 'when .allow_unknown_attributes? is false' do
        let(:allow_unknown_attributes){false}

        it 'should raise NameError' do
          expect{subject.some_random_method}.to raise_error(NameError)
        end
      end
    end
  end
end
