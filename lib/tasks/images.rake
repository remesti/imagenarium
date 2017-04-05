require 'RMagick'
include Magick

namespace :images do
  task preprocess: :environment do

    filenames = Dir['../images/*']

    filenames.each do |filename|
      puts filename

      image = ImageList.new(filename)
      width = image.columns
      height = image.rows

      puts "#{width}x#{height}"

      if width > height
        diff = width - height
        image = image.border(0, diff/2, 'none')
      else
        diff = height - width
        image = image.border(diff/2, 0, 'none')
      end

      image = image.thumbnail(600, 600)
      image.write(filename)
    end

  end
end
