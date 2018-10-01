# README

* Case A: Bit Counter

```ruby
def count_bits(path)
  f = File.open(path, 'rb') { |io| io.read }
  puts "found #{f.unpack('B*').first.count("1")} bits set to 1"
  puts "found #{f.unpack('B*').first.count("0")} bits set to 0"
  
end
```
TODO:
BANK:

controlar el usuario que hace el envio.
controlar que el amount no sea menor que 0
controlar y estar seguro que AMBAS transacciones se llevan a cabo o sino ROLLBACK.
