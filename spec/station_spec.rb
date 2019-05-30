require './lib/station.rb'

describe Station do

    subject {described_class.new("Old Street", 1)}

    it 'knows its name' do
        expect(subject.name).to eq("Old Street")
    end

end