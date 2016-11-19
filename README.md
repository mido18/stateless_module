# Stateless Module

Create stateless immutable modules in Ruby.

Read <a href="https://github.com/jwhiteman/stateless_module/blob/master/spec/stateless_module_spec.rb#L32">the short spec</a> to see what the features are.

## Installation

`gem install stateless_module'

stateless_module makes use of <a href="http://ruby-doc.org/core-2.0.0/TracePoint.html" target="_blank">TracePoint</a> so it's only good for Ruby 2.0+

## Usage

Call `stateless_module` from within your module to make it stateless:

```ruby
module MyModule
  stateless_module
end
```
