# Stateless Module

A dead simple little library to help create stateless / immutable modules in Ruby.

Once you declare that your module is stateless, then it will be protected from being included or extended
elsewhere and all of its instance and class variables will be protected from mutation.

Ruby is a great object oriented language, but sometimes you want to carve out a small island of sanity where you have no state to keep track of
and where you can be guaranteed that your code won't be used out of context.

You can read about some of the benefits to this approach <a href="http://stackoverflow.com/questions/844536/advantages-of-stateless-programming" target="_blank">here</a>.

## Installation

`gem install stateless_module'

stateless_module makes use of <a href="http://ruby-doc.org/core-2.0.0/TracePoint.html" target="_blank">TracePoint</a> so it's only good for Ruby 2.0+

## Usage

Pretty much exactly what you'd expect:

Simply call the `stateless_module` macro from within your module.

```ruby
module MyModule
  stateless_module

  def your_cool_stateless_thing
    # ...
  end
end

MyModule.your_cool_stateless_thing
```
