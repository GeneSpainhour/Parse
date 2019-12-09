#! /usr/bin/env ruby

require 'json'
require 'date'
require 'time'
class Sandwich
    include Enumerable
   

    def play(asset)
        result = look_up(asset)
       return result.find_all {|item| item.match("#{asset}:")}
    end
    def look_up(asset)
        
       %w[two-more-thing:janet two:janet-one two:janet-three two-four:janet two-five:janet two-six:janet two-seven:janet]
    end
    def strip
        s = "{\n    \"_id\": \"docker-integration.cernerrepos.net/healtheintent/analytics-query-builder:2.8.0-201...\n        \"high\": 1,\n        \"medium\": 0,\n        \"low\": 0,\n        \"total\": 1\n    }\n}"

        return s.gsub(/\s+/,'')
    end

    def look
        obj = {alpha:'one', beta:'two', gamma:'three', delta:'four'}

        obj2 = obj

        alpha_keys = obj.keys

        beta_keys = obj2.keys

        puts "key count matches" if alpha_keys.length == beta_keys.length

        alpha_keys.map { |key| 
            if obj[key]== obj2[key] 
                puts "#{obj[key]} equals #{obj2[key]}" 
            else
                puts "#{obj[key]} doesn't equal #{obj2[key]}" 
            end
        }

        result = obj.select {|k,v| k== :alpha}

        puts "result is #{result}"

        # obj.keys.map do |k|
        #     puts "obj.#{k}=#{obj[k]}"
        # end

        # items = obj.keys.map do |k|
        #     "obj.#{k}=#{obj[k]}"
        # end

        # puts 'displaying items'
        # puts
        # puts items

        # obj.values.map do |v|
        #     puts v
        # end

    end

    def examine

        raw = File.read(File.join('data', 'twistlock_scan_result.json'))

        obj = JSON.parse(raw)


        obj.keys.map do |key|
            puts " #{key}: #{obj[key]}"
        end
    end

    def view_date
        ds = "2019-11-17T13:32:29.088Z"

        theDate = Date.parse(Time.parse(ds).utc.to_s)
        puts theDate
    end
end 

puts Sandwich.new.view_date