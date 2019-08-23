class Image
  attr_accessor :image

  def initialize(data)
    @image = data
  end

  def blur(distance)
    changed = Array.new
    
    @image.each_index do |y|
      array2 = @image[y]
      array2.each_index do |x|
        if array2[x] == 1
          changed.push([x, y])
        end
      end
    end
    
    changed.each do |pixel|
      x = pixel[0]
      y = pixel[1]

      distance.times do |d|
        base = d+1
        @image[y][x-base] = 1 unless x-base < 0
        @image[y][x+base] = 1 unless x+base >= @image[y].length
        @image[y-base][x] = 1 unless y-base < 0
        @image[y+base][x] = 1 unless y+base >= @image.length
      end
    end
    return @image
  end
  
end

image = Image.new([[0,0,0,0,0,0,0,0,0,0],
                   [0,0,0,1,0,0,0,0,0,0],
                   [0,0,0,0,0,0,0,0,0,0],
                   [0,0,0,0,0,0,0,0,0,0],
                   [0,0,0,0,0,0,0,0,0,0],
                   [0,0,0,0,0,0,0,0,0,0],
                   [1,0,0,1,0,0,0,0,0,0],
                   [0,0,0,0,0,0,0,0,0,0],
                   [0,0,0,0,0,0,0,0,0,0],
                   [0,0,0,0,0,0,0,0,0,0]])

result_image = image.blur(5)

result_image.each do |n|
    puts n.to_s
end