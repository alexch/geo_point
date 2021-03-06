require 'sugar-high/arguments'
require 'geo_calc'
 #  Sample usage:                                                                                 
 #    p1 = GeoPoint.new(51.5136, -0.0983)                                                      
 #    p2 = GeoPoint.new(51.4778, -0.0015)                                                      
 #    dist = p1.distance_to(p2)          # in km                                             
 #    brng = p1.bearing_to(p2)           # in degrees clockwise from north                   
 #    ... etc                                                                                     
 # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  

class GeoPoint  
  autoload :Calc,           'geo_point/calc'
  autoload :Shared,         'geo_point/shared'
  autoload :ClassMethods,   'geo_point/class_methods'
  autoload :CoreExtension,  'geo_point/core_extension'

  include GeoPoint::Calc
  include GeoCalc::PrettyPrint

  attr_reader   :lat, :lon  

  # Creates a point on the earth's surface at the supplied latitude / longitude
  # 
  # - Numeric latitude in numeric degrees
  # - Numeric longitude in numeric degrees  

  # Optional options
  # - :radius - earth radius in km
  # - :mode - coordinates mode, either :lng_lat or :lat_lng, otherwise uses global setting as per GeoPoint.coord_mode
  def initialize *args
    options = args.is_a?(GeoPoint) ? {} : args.last_option
    earth_radius_km = options[:radius] if options[:radius]
    coord_mode = options[:mode] if options[:mode]
    
    case args.size
    when 1
      create_from_one args
    when 2
      create_from_two *args
    else
      raise "GeoPoint must be initialized with either one or to arguments defining the (latitude, longitude) coordinate on the map"
    end
  end

  extend ClassMethods
  include Shared
  include CoreExtension

  def coord_mode
    @coord_mode ||= GeoPoint.coord_mode
  end

  def earth_radius_km  
    @earth_radius_km ||= GeoPoint.earth_radius_km  # default
  end

  def lat= value 
    @lat = value.to_lat
  end

  def lon= value
    @lon = value.to_lng
  end

  (Symbol.lng_symbols - [:lon]).each do |sym|
    class_eval %{
      alias_method :#{sym}, :lon
      alias_method :#{sym}=, :lon=
    }
  end    
  alias_method :to_lng, :lng

  (Symbol.lat_symbols - [:lat]).each do |sym|
    class_eval %{
      alias_method :#{sym}, :lat
      alias_method :#{sym}=, :lat=
    }
  end
  alias_method :to_lat, :lat

  def [] key
    case key
    when Fixnum   
      raise ArgumentError, "Index must be 0 or 1" if !(0..1).cover?(key)
      to_a[key] 
    when String, Symbol
      send(key) if respond_to? key
    else
      raise ArgumentError, "Key must be a Fixnum (index) or a method name"  
    end    
  end

  alias_method :to_dms, :to_s

  def reverse_point!
    self.lat = lat * -1
    self.lng = lng * -1
    self    
  end

  def reverse_point
    self.dup.reverse_point!
  end

  def to_lat_lng
    [lat, lng]
  end

  def to_lng_lat
    [lng, lat]
  end

  def to_a
    send(:"to_#{coord_mode}")
  end
  
  protected

  def is_numeric? arg
    arg.is_a? Numeric
  end  

  alias_method :is_num?, :is_numeric?

  def check_numeric! arg
    raise ArgumentError, "Argument must be Numeric" if !is_numeric? arg
  end

  def to_coords points
    meth = :"to_#{coord_mode}"
    puts "to_coords #{points.inspect} - #{coord_mode} - #{points.class}"
    # return points.send(meth) if points.first.kind_of? String
    points.send(meth)
  end
  
  def create_from_one args
    args = args.first
    array = to_coords(args)
    # array = (coord_mode == :lng_lat && args.is_a?(Hash) ) ? array.reverse : array
    create_from_two *array
  end
  
  def create_from_two lat, lon
    @lat    = lat.to_lat
    @lon    = lon.to_lng
  end  
end

