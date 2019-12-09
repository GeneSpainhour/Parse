#! /usr/bin/env ruby

require 'json'

class Provider 

    include Enumerable

    def initialize(asset)
        @asset = asset
        @api_response_json = File.read(File.join('data', 'twistlock_api_response.json'))
    end
    def asset
        @asset
    end
    def api_response_json
        @api_response_json
    end

    def api_response
        JSON.parse(api_response_json)
    end

    def result(asJson)
        data = api_response

        raw = data.find_all { |s| s["_id"].match("#{asset}:")}
            .sort_by { |k| k["info"]["createdTime"]}
            .reverse
            .first unless data.nil?
        
        return nil if raw.nil?

        # p raw["_id"]
        item = {
            :_id => raw["_id"], 
            :createdTime=> raw["info"]["createdTime"],
            :cveVulnerabilities=> raw["info"]["cveVulnerabilities"],
            :complianceVulnerabilities=> raw["info"]["complianceVulnerabilities"],
            :cveVulnerabilityDistribution=> raw["info"]["cveVulnerabilityDistribution"],
            :complianceDistribution=> raw["info"]["complianceDistribution"]
        }
        
         asJson == true ? JSON.generate(item ): item
    end

 end

#  open('result.json', 'w') do |f|
#     f << Provider.new("healtheintent/analytics-query-builder").result(true) + '\n'
#  end
 

# items_json = File.read(File.join('data', 'twistlock_api_response.json'))

# items = JSON.parse(items_json)

# raw = items
#     .find_all{ |item| item["_id"].match("#{asset}:")}
#    .sort_by {|item| item["info"]["createdTime"] }    #sort_by time returns ascending order
#    .reverse                                        #reverse so latest on top
#     .first                                          #get latest record

# return nil if raw.nil?

# result = {
#     _id: raw["_id"], 
#     createdTime: raw["info"]["createdTime"],
#     cveVulnerabilities: raw["info"]["cveVulnerabilities"],
#     complianceVulnerabilities: raw["info"]["complianceVulnerabilities"],
#     cveVulnerabilityDistribution: raw["info"]["cveVulnerabilityDistribution"],
#     complianceDistribution: raw["info"]["complianceDistribution"]
# }.to_json 
 
# p result