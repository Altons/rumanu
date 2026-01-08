# frozen_string_literal: true

RSpec.describe Rumanu::VERSION do
  it 'is a valid semantic version string' do
    expect(Rumanu::VERSION).to match(/^\d+\.\d+\.\d+$/)
  end

  it 'is defined as a constant' do
    expect(defined?(Rumanu::VERSION)).to eq('constant')
  end

  it 'is a string' do
    expect(Rumanu::VERSION).to be_a(String)
  end
end
