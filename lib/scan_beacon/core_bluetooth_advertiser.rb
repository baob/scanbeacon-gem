module ScanBeacon
  class CoreBluetoothAdvertiser < GenericIndividualAdvertiser

    def initialize(opts = {})
      puts "before CoreBluetoothAdvertiser init"
      super
      puts "after CoreBluetoothAdvertiser init #{inspect}"
    end

    def ad=(value)
      @ad = value
      puts "before CoreBluetoothAdvertiser#ad="
      CoreBluetooth.set_advertisement_data @ad
      puts "after CoreBluetoothAdvertiser#ad="
    end

    def start(with_rotation = false)
      CoreBluetooth.start_advertising(with_rotation)
    end

    def stop
      CoreBluetooth.stop_advertising
    end

    def rotate_addr_and_update_ad
      self.update_ad
      self.stop
      self.start(true)
    end

    def inspect
      "<CoreBluetoothAdvertiser ad=#{@ad.inspect}>"
    end

  end
end
