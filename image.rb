class Image

    attr_accessor :pixels
    
    def initialize (pixels)
       @pixels = pixels
    end
    
    def find_ones
      locations = []
      pixels.each_with_index do |row,y|
        row.each_with_index do |value,x|
          if (value == 1)
            locations.push([y,x])
          end
        end
      end 
      return locations
    end

    def output_image
       
           @pixels.each do |x|
                 x.each do |y|
                 print y
                end
               puts "\n"
               
            end    
    end

    
    def blur (distance)
             find_ones.each do |coord|
              y = coord[0]
              x = coord[1]
              distance.each do |z|
                pixels[y-z][x] = 1 if y >= z;
              end
              pixels[y+1][x] = 1 if y <= pixels.length-1;
              pixels[y][x-1] = 1 if x >= 1;
              pixels[y][x+1] = 1 if y <= pixels.length-1;
             end        
    end
end

    image = Image.new ([[0, 1, 0, 0],[0, 1, 0, 0],[0, 0, 0, 0],[0, 0, 0, 0],[0, 0, 0, 0], [0, 0, 0, 0]])
    image.blur
    image.output_image
