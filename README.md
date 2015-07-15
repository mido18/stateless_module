# StatelessModule

A simple lib that wraps `extend self` in Ruby modules.

## Installation

`gem install stateless_module'

## Justification

### Style Guides & Static Code Analyzers

Some [style guides](https://github.com/bbatsov/ruby-style-guide#module-function) make `extend self` verboten,
which is absurd, but sometimes this is out of your control.

As well, subjectively, declaring `stateless_module` is a bit more descriptive than `extend self`.

### Why not just use `module_function` ?

`module_function` has different semantics than `extend self`. In particular, they handle private methods differently.

## Usage

Simply include StatelessModule in your Module:

```ruby
module MyModule
  include StatelessModule
end
```

If you want to have a `stateless_module` macro that is available in all Modules, you can
add a slight monkey-patch to the Module class:

```ruby
class Module
  def stateless_module
    include StatelessModule
  end
end
```

But this behavior is not added by default. It's up to you to include `StatelessModule`
in a way that is safe for _your_ application.

## Example

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
