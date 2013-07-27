require './spec/spec_helper'

describe 'Hash' do
  describe '#filter!' do
    subject do
      {
        white: :val, black: :val,
        nested: { white: :val, black: :val,
                  deep_nested: { white: :val, black: :val } }
      }
    end

    let(:filter) do
      { white: true, nested: { white: :yes, deep_nested: { white: 1 } } }
    end

    let(:filtered) do
      { white: :val, nested: { white: :val, deep_nested: { white: :val } } }
    end

    it 'keeps only items specified in the filter param' do
      subject.filter!(filter)
      subject.must_equal filtered
    end
  end

  describe '#keys_info' do
    subject { {string: 'explorer', int: 42, nested: { array: ['foo', 'bar'] } } }

    it 'returns similar hash but values are class names of actual values' do
      subject.keys_info.must_equal({ string: 'String', int: 'Fixnum',
                                     nested: { array: 'Array'} })
    end
  end

  describe '#symbolize_keys!' do
    subject { { 'foo' => 'bar', sym: 'ok' } }

    it 'symbolize keys' do
      subject.symbolize_keys!
      subject.must_equal({ foo: 'bar', sym: 'ok' })
    end
  end
end
