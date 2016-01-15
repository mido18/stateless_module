# StatelessModule

A dead simple little library to help create stateless / immutable modules in Ruby.

Once you declare that your module is stateless, then it will be protected from being included or extended
elsewhere and all of its instance and class variables will be protected from mutation.

Ruby is a great object oriented language, but sometimes you want to carve out a small island of sanity where you have no state to keep track of
and where you can be guaranteed that your code won't be used out of context (e.g threading).

You can read about some of the benefits to this approach <a href="http://stackoverflow.com/questions/844536/advantages-of-stateless-programming" target="_blank">here</a>.

## Derp

> This is stupid. I could just use `module_function`, or `extend self`, or a frozen singleton, or a frozen module, or _blank_ to do the same thing...

Maybe. But all of those approaches lack something: `module_function` falls down with private methods; `extend self` offers zero protection against mutation
(or being included elsewhere); a frozen singleton would be pretty close, but you'd still be able to mutate instance variables and, semantically,
a singleton is an _instance_ of a thing, which is what we're trying to get away from here.

A frozen module would be very close, indeed, to what this library offers, but you'd still have no protection against any instance variables themselves
being mutated.

At the end of the day, you could write all of this code in under an hour.

Or you could just save yourself the hassle and use this gem.


## Installation

`gem install stateless_module'

## Usage

Simply call the `stateless` function from within your module:

```ruby
module MyModule
  stateless_module

  def some_function
    # ...
  end

  def another_function
    # ...
  end

  # etc...
end
```

