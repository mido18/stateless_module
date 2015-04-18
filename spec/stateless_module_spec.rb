require 'spec_helper'

module TestModule
  include StatelessModule

  def some_method
    42
  end

  def complex_method
    some_private_method
  end

  private

  def some_private_method
    7
  end
end

describe StatelessModule do
  it "defined methods are available to the module" do
    expect(TestModule.some_method).to eq(42)
  end

  it "uses its private methods" do
    expect(TestModule.complex_method).to eq(7)
  end

  it "throws an error if some schmuck tries to include it" do
    expect do
      class Schmuck
        include TestModule
      end
    end.to raise_error("TestModule is a Stateless Module. Don't include it elsewhere.")
  end
end
