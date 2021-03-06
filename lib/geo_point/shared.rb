class GeoPoint
  module Shared
    def unit
      :degrees
    end

    def earth_radius_km= radius_km
      raise ArgumentException, "Not a valid earth km radius: #{radius_km}" unless valid_earth_radius? radius_km
      @earth_radius_km = radius_km
    end

    def coord_mode= mode
      raise ArgumentException, "Not a valid coordinates mode: #{mode}" unless valid_mode? mode
      @coord_mode = mode
    end
  
    protected

    def is_numeric? arg
      arg.is_a? Numeric
    end  

    alias_method :is_num?, :is_numeric?
  
    def check_numeric! arg
      raise ArgumentError, "Argument must be Numeric" if !is_numeric? arg
    end

    def valid_earth_radius? radius_km
      is_numeric?(radius_km) && radius_km.is_between?(6350, 6380)            
    end           

    def valid_mode? mode 
      [:lng_lat, :lat_lng].include? mode
    end    
  end
end