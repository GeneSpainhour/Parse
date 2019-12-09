require 'provider.rb'
require 'json'
RSpec.describe 'Exercising the provider' do
    
   
    context 'initialize' do
        let(:asset){"healtheintent/analytics-query-builder"}
        let(:obj) { Provider.new(asset)}
        let (:expected_keys){[:_id, :createdTime,:cveVulnerabilities,:complianceVulnerabilities,:cveVulnerabilityDistribution,:complianceDistribution]}
        let(:expected_string_keys){["_id","createdTime","cveVulnerabilities","complianceVulnerabilities","cveVulnerabilityDistribution","complianceDistribution"]}
        let(:scan_result) {File.read(File.join('data', 'twistlock_scan_result.json'))}

        it 'displays asset' do
            expect(obj.asset).to eq(asset)
        end

        it 'shows json response' do
            expect(obj.api_response_json).to_not be(nil)
        end

        it 'shows response' do
            response = obj.api_response
            expect(response).to_not be(nil)

            expect(response.first.keys.length).to_not be(0)
        end

        it 'returns nil if not found' do
            allow(obj).to receive(:api_response).and_return (nil)
            allow(obj).to receive(:result).with(false).and_call_original
            result = obj.result(false)
            expect(result).to be(nil)
        end

        it 'produces json result' do
            expect(obj.result(true).length).to_not be (0)
        end

        it 'produces result' do
            expect(obj.result(false).keys.length).to_not be (0)
        end

        it 'produces the correct keys' do
            observed = JSON.parse(obj.result(true))

            result = JSON.parse(scan_result)

            expected_string_keys.map { |k| 
                expect(observed.has_key?(k)).to eq(true)
                
                expect(result.has_key?(k)).to eq(true)
            }
        end

        it 'returns correct values' do
            result = JSON.parse(obj.result(true))

            # result.keys.map { |k|
            #     puts "result[#{k}]: #{result[k]}"
            # }

            expected = JSON.parse(scan_result)

            expected.keys.map { |k|

                #mapped_key = k == :_id ? :id : k
                # if expected[k] != result[k]
                #     puts "\t\texpected[#{k}]: #{expected[k]}"
                #     puts "\t\tbut got[#{k}]: #{result[k]}"
                #     break
                # end
                expect(result[k]).to eq (expected[k])
            }
        end

    end

   
end

# it 'can load' do
#     _san = provider.new

# allow(_san).to receive(:lookup).and_return( %w[two-more-thing:janet two:janet-one two:janet-three two-four:janet two-five:janet two-six:janet two-seven:janet])
# allow(_san).to receive(:play).with(asset).and_call_original
# result = _san.play(asset)
# expect(result).to include("two:janet-one")
# expect(result.length).to be(2)
# end
