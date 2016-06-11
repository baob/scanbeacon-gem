module ScanBeacon
  class GenericAdvertiser
    attr_accessor :beacon, :parser, :ad
    attr_reader :advertising

    def initialize(opts = {})
      self.beacon = opts[:beacon]
      self.parser = opts[:parser]
      self.ad = opts[:ad] if opts[:ad]
      if beacon
        puts 'before parser'
        self.parser ||= BeaconParser.default_parsers.find do |parser|
          puts "is the problem p.b_t #{parser.beacon_type}"
          puts "is the problem b.b_t.f #{beacon.beacon_types.first}"
          x = parser.beacon_type == beacon.beacon_types.first
          puts "result = #{x.inspect}"
          x
        end
        puts "after parser, parser = #{parser.inspect}"
      end
      @advertising = false
    end

    def start(with_rotation = false)
      raise NotImplementedError
    end

    def stop
      raise NotImplementedError
    end

    def inspect
      raise NotImplementedError
    end
  end
end
