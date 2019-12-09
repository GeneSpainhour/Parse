#! /usr/bin/env ruby

class HashEssay
    def initialize
        @hash_alpha = {alpha: "one", beta:"two", gamma: "three", delta: "four"}
        @hash_uno = {"uno":"one", "dos": "two", "tres":"three", "quatro":"four"}
    end
    def hash_alpha
        @hash_alpha
    end

    def hash_uno
        @hash_uno
    end
end

hash_obj = HashEssay.new

p hash_obj.hash_uno
p hash_obj.hash_uno.has_key?("dos".to_sym)
#p hash_obj.hash_alpha.has_key?("delta")