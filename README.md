# StatelessModule

A simple lib that wraps `extend self` in Ruby modules.

## Installation

`gem install stateless_module'

## Examples

```ruby
module YourModule
  stateless_module

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
```

You could then use `YourModule` as a semi-stateless module /  namespace:

```ruby
YourModule.some_method
# => 42

YourModule.complex_method
# => 7

# safety: your module won't get accidentally included elsewhere
class SomeClass
  include YourModule
end
# => Error

# safety: your module won't get accidentally extended elsewhere
class SomeClass
  extend YourModule
end
# => Error
```

## Why not just use `module_function` ?

You could. But `module_function` has some problems with private methods.
It's not really an exact replacement of `extend self`.

## OK. Why not just use `extend self` ?

You could - and maybe you should. But stateless_module also makes it so that any
module you define as stateles won't be able to be included or extended elsewhere.

This adds a bit of safety by enforcing that your module won't get mixed up
in some other object's state.

Also declaring `stateless_module` is a bit more descriptive than
`extend self`.

