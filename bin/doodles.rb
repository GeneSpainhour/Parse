#! /usr/bin/env ruby
require 'json'
# require 'byebug'


class Doodle 
    include Enumerable
#  cveVulnerabilityDistribution, complianceDistribution, complianceVulnerabilities, cveVulnerabilities
    def self.records(asset) 
        items_json = File.read(File.join('data', 'twistlock_api_response.json'))

        items = JSON.parse(items_json)
        
        raw = items
            .find_all{ |item| item["_id"].match("#{asset}:")}
           .sort_by {|item| item["info"]["createdTime"] }    #sort_by time returns ascending order
           .reverse                                        #reverse so latest on top
            .first                                          #get latest record

        return nil if raw.nil?
     
        result = {
            _id: raw["_id"], 
            createdTime: raw["info"]["createdTime"],
            cveVulnerabilities: raw["info"]["cveVulnerabilities"],
            complianceVulnerabilities: raw["info"]["complianceVulnerabilities"],
            cveVulnerabilityDistribution: raw["info"]["cveVulnerabilityDistribution"],
            complianceDistribution: raw["info"]["complianceDistribution"]
        }.to_json 
         
        p result
    end
end

Doodle.records("healtheintent/analytics-query-builder") 

