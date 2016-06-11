module ScanBeacon
  class GenericIndividualAdvertiser < GenericAdvertiser
    def initialize(opts={})
      @parser = nil
      r = super(opts)
      "returning from super in GenericIndividualAdvertiser #{inspect}"
      r
    end

    def beacon=(value)
      @beacon = value
      update_ad
    end

    def parser=(value)
      puts "in GenericIndividualAdvertiser#parser= 1"
      @parser = value
      puts "in GenericIndividualAdvertiser#parser= 2"
      update_ad
      puts "in GenericIndividualAdvertiser#parser= 3"
    end

    def update_ad
      puts "in GenericIndividualAdvertiser#update_ad @parser && @beacon = #{@parser.inspect} #{@beacon.inspect}"
      r = self.ad = @parser.generate_ad(@beacon) if @parser && @beacon
      puts "ad.inspect #{r.inspect}"
      r
    end

    def ad=(value)
      @ad = value
      self.start if advertising
    end
  end
end
