#define mathematical methods
module Enumerable

    def sum
      self.inject(0){|accum, i| accum + i }
    end

    def mean
      self.sum/self.length.to_f
    end

    def sample_variance
      m = self.mean
      sum = self.inject(0){|accum, i| accum +(i-m)**2 }
      sum/(self.length - 1).to_f
    end

    def standard_deviation
      return Math.sqrt(self.sample_variance)
    end
end




#method for each individual roll, and generating individual series of rolls
def dice_roll threshold

    temp_value = 0
    array = []

    while true
        x = rand(1..6)
        if temp_value < threshold
            temp_value = temp_value + x
            array << x
        else
            break
        end
    end
    return array
end



#method for array containing all series of rolls
def add_rolls
    # define methods for rolling dice
    puts "What is your threshold?  20, or 10000"

    threshold = gets.chomp.to_i
    temp_array = []
    series_details = []
    series_summed = []
    series_post_threshold = []
    puts "how many separate roll series do you want?"
    rolls = gets.chomp.to_i

    while series_details.count < rolls
        temp_array = dice_roll(threshold)
        series_details << temp_array
        # series_details << dice_roll.inject(:+)
        # roll_series << dice_roll.dup.inject(:+) - $threshold
        series_summed << temp_array.reduce{|sum, x| (sum + x) } - 20

        # series_post_threshold << temp_array.reduce{|sum, x| sum + x}
        # series_post_threshold = series_post_threshold.dup.each{|x| }



    end


    puts "series details:  " + series_details.inspect
    puts "series_summed details:  " + series_summed.inspect
    puts "series_post_threshold details:  " + series_post_threshold.inspect

    # puts "Series minus Threshold (#{$threshold}):  " + (series_details.reduce(:+).collect{|x| x - $threshold})
    # puts roll_series.inspect

    # puts "Average:  #{roll_series.mean}"
    # puts "Standard Deviation of M = #{$threshold}:  #{roll_series.standard_deviation}"


    #if
    # average = roll_series.inject(:+).to_f / roll_series.size
    # print "average of values:  "
    # puts average

end


#run code
add_rolls
