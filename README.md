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

Note that the collectd-dsl converts snake-case to CamelCase

```ruby
config = Collectd::DSL.parse do
  load_plugin :redis
  load_plugin :java
  load_plugin :disk
  
  plugin :disk do
    disk "/dev/sda"
	disk "/dev/sdb"
	ignore_selected "false"
  end
end

```

The following will be output
```
LoadPlugin redis
LoadPlugin java
LoadPlugin disk
<Plugin disk>
	Disk "/dev/sda"
	Disk "/dev/sdb"
	IgnoreSelected "false"
</Plugin>

```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
