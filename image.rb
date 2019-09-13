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
               i = 0
               while i <= distance 
                  pixels[y-i][x] = 1
                   i = i + 1
                  break if i > y

                end
                j = 0
                while j < distance 
                 pixels[y+j][x] = 1 
                  j = j + 1
                   break if j > pixels.length-1-y
                end
              
              k = 0
              while k <= distance 
                pixels[y][x-k] = 1 
                 k=k+1
                  break if k > x;
              end

              l = 0
              while l < distance
               pixels[y][x+l] = 1 
               l=l+1
                break if l > pixels[0].length-2;
             end
           end
    end
end

    image = Image.new ([[0, 0, 0, 0],[0, 0, 0, 0],[0, 0, 0, 0],[0, 1, 0, 0],[0, 0, 0, 0], [0, 0, 0, 0]])
    image.blur(3)
    image.output_image
