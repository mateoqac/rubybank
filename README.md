# README

* Case A: Bit Counter

```ruby
def count_bits(path)
  f = File.open(path, 'rb') { |io| io.read }
  puts "found #{f.count("1")} bits set to 1"
  puts "found #{f.count("0")} bits set to 0"
end
```
