#! /usr/bin/env ruby

class Range
    def by(step)

        x = self.begin
        
        while not_done(x)
            yield x
            x += step
        end
    end

    private

    def not_done(v)
        exclude_end? ? v <self.end : v <= self.end
    end
   
end


(0..10).by(2) {|x| print x}


(0...10).by(2) { |x| print x}


alpha = Array.new(10) { |i| 2*i+1}

print "\n#{alpha}\n"