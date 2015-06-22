require 'spec_helper'
require 'scan_beacon'

RSpec.describe ScanBeacon::BLE112Scanner do
  let(:buffer) { "\x80*\x06\x00\xAC\x02\xB3\x89\x9C\x9B\xF0\xDD\x01\xFF\x1F\x02\x01\x06\e\xFF\x18\x01\xBE\xAC,\xBC&\eJ\aBx\xA5\x13\x8B\xF3\xF8\x01#t\x00\xC8\x00Q\xC4b" }

  it "can scan for altbeacons" do
    scanner = ScanBeacon::BLE112Scanner.new
    scanner.clear_the_buffer
    expect {
      buffer.unpack('C*').each {|byte| scanner.append_to_buffer(byte)}
    }.to change { scanner.beacons.size }.by(1)
  end

  it "can use a beacon parser to parse an altbeacon" do
    scanner = ScanBeacon::BLE112Scanner.new
    scanner.clear_the_buffer
    buffer.unpack('C*').each {|byte| scanner.append_to_buffer(byte)}
    expect( scanner.beacons[0].uuid ).to eq("2CBC261B-4A07-4278-A513-38BF3F8012374")
  end
end
