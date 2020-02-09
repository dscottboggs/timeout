# timeout
A VERY simple library for timing-out a potentially infinitely-running function call

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     timeout:
       github: dscottboggs/timeout
   ```

2. Run `shards install`

## Usage

```crystal
require "timeout"

Timeout(String).try_for 1.second do
  # some maybe long-running code
end
```

Unfortunately, for now you must specify the return-type of the block, due to a restriction in Crystal's type system.

## Contributing

1. Fork it (<https://github.com/dscottboggs/timeout/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`).
4. Run `crystal tool format` and `crystal spec` on the project.
5. Push to the branch (`git push origin my-new-feature`)
6. Create a new Pull Request

## Contributors

- [D. Scott Boggs](https://github.com/dscottboggs) - creator and maintainer
