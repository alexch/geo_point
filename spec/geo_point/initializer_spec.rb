require 'spec_helper'

# - www.movable-type.co.uk/scripts/latlong.html
describe GeoPoint do  
  before do
    GeoPoint.earth_radius_km = 6371
  end
  
  describe '#initializer' do
    describe '1 argument' do
      describe 'single String' do
        describe '50.1, 5.0 ' do
          it 'should create a GeoPoint' do
            p1 = GeoPoint.new "50.1, 5.0"
            p1.should be_a(GeoPoint)
            p1.lat.should == 50.1
            p1.lon.should == 5.0
            p1.unit.should == :degrees
            p1.earth_radius_km.should == 6371
          end
        end    

        describe '(50.1, 5.0)' do
          it 'should create a GeoPoint' do
            p1 = GeoPoint.new "(50.1, 5.2)"
            p1.should be_a(GeoPoint)
            p1.lat.should == 50.1
            p1.lon.should == 5.2
            p1.unit.should == :degrees
            p1.earth_radius_km.should == 6371
          end
        end 
      
        describe '58 38 38N, 003 04 12W' do
          it 'should create a GeoPoint' do
            p1 = GeoPoint.new "58 38 38N, 003 04 12W"
            p1.should be_a(GeoPoint)
            p1.lat.should be_within(0.5).of(58.38)
            p1.lon.should be_within(0.5).of(-3)
            p1.unit.should == :degrees
            p1.earth_radius_km.should == 6371
          end
        end 

        describe '(58 38 38N, 003 04 12W)' do
          it 'should create a GeoPoint' do
            p1 = GeoPoint.new "(58 38 38N, 003 04 12W)"
            p1.should be_a(GeoPoint)
            p1.lat.should be_within(0.5).of(58.38)
            p1.lon.should be_within(0.5).of(-3) # W is negative, then normalize
            p1.unit.should == :degrees
            p1.earth_radius_km.should == 6371
          end
        end
      end
    
      describe 'single Array' do
        describe '2 Fixed numbers: 50,5 ' do
          it 'should create a GeoPoint' do
            p1 = GeoPoint.new [50, 5]
            p1.should be_a(GeoPoint)
            p1.lat.should == 50
            p1.lon.should == 5
            p1.unit.should == :degrees        
            p1.earth_radius_km.should == 6371
          end
        end
      
        describe '2 Float numbers: 50.1, 5.0 ' do
          it 'should create a GeoPoint' do
            p1 = GeoPoint.new [50.1, 5.0]
            p1.should be_a(GeoPoint)
            p1.lat.should == 50.1
            p1.lon.should == 5.0
            p1.unit.should == :degrees
            p1.earth_radius_km.should == 6371
          end
        end            
      
        describe 'single Hash' do
          describe 'with: {:lat => 50.1, :lng => 5.1}' do
            it 'should create a GeoPoint' do
              p1 = GeoPoint.new :lat => 50.1, :lng => 5.1
              p1.should be_a(GeoPoint)
              p1.lat.should == 50.1
              p1.lon.should == 5.1
              p1.unit.should == :degrees
              p1.earth_radius_km.should == 6371
            end
          end            
  
          describe 'with: {:lat => 50.1, :long => 5.1}' do
            it 'should create a GeoPoint' do
              p1 = GeoPoint.new :lat => 50.1, :long => 5.1
              p1.should be_a(GeoPoint)
              p1.lat.should == 50.1
              p1.lon.should == 5.1
              p1.unit.should == :degrees
              p1.earth_radius_km.should == 6371
            end
          end            
  
          describe 'with: {:latitude => 50.1, :longitude => 5.1}' do
            it 'should create a GeoPoint' do
              p1 = GeoPoint.new :latitude => 50.1, :longitude => 5.1
              p1.should be_a(GeoPoint)
              p1.lat.should == 50.1
              p1.lon.should == 5.1
              p1.unit.should == :degrees
              p1.earth_radius_km.should == 6371
            end
          end
        end
      end     
    end 
  
    describe 'with 2 arguments' do
      describe '2 Fixed numbers (Fixnum)' do
        it 'should create a GeoPoint' do
          p1 = GeoPoint.new 50, 5
          p1.should be_a(GeoPoint)
          p1.lat.should == 50
          p1.lon.should == 5
          p1.unit.should == :degrees        
          p1.earth_radius_km.should == 6371
        end
      end

      describe '2 Float numbers' do
        it 'should create a GeoPoint' do
          p1 = GeoPoint.new 50.1, 5.0
          p1.should be_a(GeoPoint)
          p1.lat.should == 50.1
          p1.lon.should == 5.0
          p1.unit.should == :degrees
          p1.earth_radius_km.should == 6371
        end
      end    
    
      describe '2 Strings: "58 38 38N", "003 04 12W"' do
        it 'should create a GeoPoint' do
          p1 = GeoPoint.new "58 38 38N", "003 04 12W"
          p1.should be_a(GeoPoint)
          p1.lat.should be_within(0.5).of(58.38)
          p1.lon.should be_within(0.5).of(-3)
          p1.unit.should == :degrees
          p1.earth_radius_km.should == 6371
        end
      end  
    end
  end # initializer
end