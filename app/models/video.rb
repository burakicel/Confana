class Video < ActiveRecord::Base

	require 'net/http'

	def self.request(url)
		download_urls = ViddlRb.get_urls(url)

		File.open("pleasework.mp4", "wb") do |saved_file|
  # the following "open" is provided by open-uri
  open(download_urls.first, "rb") do |read_file|
    saved_file.write(read_file.read)
  end
end

		movie = FFMPEG::Movie.new("pleasework.mp4")
		transcoded_movie = movie.transcode("soundtessst.mp3").audio_codec
        return transcoded_movie
	end

end
