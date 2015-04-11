require 'descriptive_statistics'

puts "What is your threshold?  20, or 10000"
$threshold = gets.chomp.to_i

def dice_roll
    @array = [0]
    @sums = []
    while true
        x = rand(1..6)
        if @array.inject(:+) < $threshold
            @array << x
        else
            break
        end
    end
    return @array
end


def add_rolls
    roll_series = []
    puts "how many separate roll series do you want?"
    rolls = gets.chomp.to_i

    while roll_series.count < rolls
        roll_series << dice_roll.dup.inject(:+)-$threshold
    end

    puts roll_series.inspect
    puts "Average:  #{roll_series.mean}"
    puts "Standard Deviation of M = #{$threshold}:  #{roll_series.standard_deviation}"

    #
    # average = roll_series.inject(:+).to_f / roll_series.size
    # print "average of values:  "
    # puts average

end

add_rolls
