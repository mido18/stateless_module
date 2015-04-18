# StatelessModule

A simple lib that wraps `extend self` in Ruby modules.

Ex:

```ruby
module YourModule
  acts_as_stateless_module

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
```

## Why not just use `module_function` ?

You could. But `module_function` has some problems with private methods.
It's not really an exact replacement of `extend self`.

## OK. Why not just use `extend self` ?

You could - and maybe you should. But this lib also makes it so that any
module you define as stateles won't be able to be included or extended elsewhere.

This might add a bit of safety.

Also declaring `acts_as_stateless_module` is a bit more descriptive than
`extend self`.

