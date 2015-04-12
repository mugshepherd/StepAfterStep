# What is the mean of the sum minus M when M=20?*
# if x = rand(1..6)


1. add rolls to an array value until that value >= 20
2. once >= 20, starts over.  REturns to next value in array.




what is n

counter = 1
counter += 1 if (counter*(rand(1..6)).inject(:+)) <= 20

array = [0]
x = rand(1..6)
while array.inject (:+) < 20
    array << x
end



    array.inject{:+} <== 20 do
    array.push(x).inject{:+}
end

puts array



array = [0]
while true
    x = rand(1..6)
    if array.inject (:+) < 20
        array << x
    end
end
puts array











#

class Array
    @array = []
end


def roll
    @roll = rand(1..6)
end

def die_rolls(roll)
    eval(@roll)
end

n = 1000000
roll_series = Array.new(n)

n.times do |i|
    roll_series[i] = eval(@roll)
end

puts roll_series.count(true)/n.to_f





irb(main):021:0> counter = 0
=> 0
irb(main):022:0> 1000000.times{counter += 1 if rand(1..6)      }
=> 1000000
irb(main):023:0> puts String(Float(counter)/10000) + "%"
20.0002%
=> nil




What is the standard deviation of the sum minus M when M=20?*


What is the mean of the number of rolls when M=20?*
# if x = rand(1..6)
# how many times x to equal >= 20


What is the standard deviation of the number of rolls when M=20?*




What is the mean of the sum minus M when M=10000?*


What is the standard deviation of the sum minus M when M=10000?*


What is the mean of the number of rolls when M=10000?*


What is the standard deviation of the number of rolls when M=10000?*
