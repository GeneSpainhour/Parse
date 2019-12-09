#! /usr/bin/env ruby

class ExceptionEssay

    def self.test(num, den)
        puts "before throw"
        begin
            value = calculate(num, den)
            puts value
            rescue => e
                puts e.message
                puts e.backtrace.inspect
        end
   
        
    end

    def self.calculate(num, den)
        raise "you're trying to divide #{num} by #{den}" if den==0
        num/den
    end
end

ExceptionEssay.test(100, 10)
ExceptionEssay.test(100, 5)
ExceptionEssay.test(100, 0)