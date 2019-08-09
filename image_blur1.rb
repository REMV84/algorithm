class Image

  def initialize (array_in)
    @arr = array_in
  end

  def output_image
    @arr.each do |row|
      output = ""
      row.each do |item|
        output += item.to_s
      end
      puts output
    end
  end

end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
image.output_image

