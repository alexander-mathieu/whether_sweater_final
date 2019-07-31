task hoard_background_images: :environment do
  puts 'Hoarding background images...'
  ImageHoarderWorker.new.perform
  puts 'Background images stashed!'
end
