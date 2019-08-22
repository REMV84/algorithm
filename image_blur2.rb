class Image
  attr_accessor :image

  def initialize(data)
    @image = data
  end

  def blur
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
      @image[y][x-1] = 1 unless x-1 < 0
      @image[y][x+1] = 1 unless x+1 >= @image[y].length
      @image[y-1][x] = 1 unless y-1 < 0
      @image[y+1][x] = 1 unless y+1 >= @image.length
    end
    return @image
  end
  
end

image = Image.new([[0,0,0,0,0],
                   [0,0,0,1,0],
                   [0,0,0,0,0],
                   [1,0,0,1,0],
                   [0,0,0,0,0]])

result_image = image.blur

result_image.each do |n|
    puts n.to_s
end