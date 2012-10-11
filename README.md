# Collectd::DSL

Write Collectd configurations in Ruby

## Installation

Add this line to your application's Gemfile:

    gem 'collectd-dsl'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install collectd-dsl

## Usage

```ruby
config = Collectd::DSL.parse do
  LoadPlugin :redis
  LoadPlugin :java
  LoadPlugin :disk
  
  Plugin :disk do
    Disk "/dev/sda"
	Disk "/dev/sdb"
	IgnoreSelected "false"
  end
end

```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
