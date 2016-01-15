require 'spec_helper'

module TestModule
  stateless_module

  @foo  = "hello, world"
  @@bar = "hello, venus"

  class << self
    attr_accessor :foo
  end

  def some_method
    @@bar
  end

  def some_mutator(state)
    @state = state
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
  it "results in a frozen module" do
    expect(TestModule).to be_frozen
  end

  it "can respond to its methods" do
    expect(TestModule.some_method).to eq("hello, venus")
  end

  it "can make use of its private methods" do
    expect(TestModule.complex_method).to eq(7)
  end

  it "throws an error if a class tries to include a stateles module" do
    expect do
      class SomeClass
        include TestModule
      end
    end.to raise_error("TestModule is a Stateless Module. Don't include it elsewhere.")
  end

  it "throws an error some  tries to extend a stateless module" do
    expect do
      class SomeClass
        extend TestModule
      end
    end.to raise_error("TestModule is a Stateless Module. Don't include it elsewhere.")
  end

  it "cannot alter instance variables" do
    expect do
      TestModule.instance_variable_set(:@foo, 42)
    end.to raise_error RuntimeError, /frozen/i
  end

  it "cannot change class variables" do
    expect do
      TestModule.class_variable_set(:@@bar, 42)
    end.to raise_error RuntimeError, /frozen/i
  end

  it "has frozen instance variables" do
    expect do
      TestModule.foo.reverse!
    end.to raise_error RuntimeError, /frozen/i
  end

  it "has frozen class variables" do
    expect do
      TestModule.some_method.reverse!
    end.to raise_error RuntimeError, /frozen/i
  end

  it "cannot be altered via accessors" do
    expect do
      TestModule.foo = 42
    end.to raise_error RuntimeError, /frozen/i
  end

  it "cannot be altered via mutators/setters" do
    expect do
      TestModule.some_mutator(42)
    end.to raise_error RuntimeError, /frozen/i
  end

end

