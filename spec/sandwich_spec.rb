 require 'sandwich.rb'
RSpec.describe 'Stubbing the sandwich' do
    context 'initial' do
        let(:asset){"two"}
        it 'can load' do
            _san = Sandwich.new

        allow(_san).to receive(:lookup).and_return( %w[two-more-thing:janet two:janet-one two:janet-three two-four:janet two-five:janet two-six:janet two-seven:janet])
        allow(_san).to receive(:play).with(asset).and_call_original
        result = _san.play(asset)
        expect(result).to include("two:janet-one")
        expect(result.length).to be(2)
        end
    
    end

   
end