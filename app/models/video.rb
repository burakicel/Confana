class Video < ActiveRecord::Base

	require 'net/http'
	require 'open-uri'
	require 'rest_client'


	def self.request(url)

		#Generate Mp4 link for download
		download_urls = ViddlRb.get_urls(url)

		#Download Mp4 to Local Machine
		File.open("pleasework.mp4", "wb") do |saved_file|
  		# the following "open" is provided by open-uri
  		open(download_urls.first, "rb") do |read_file|
  			saved_file.write(read_file.read)
  		end
  	end

		#Extract the voice and cut the duration to 9 seconds.
		options = { duration: "9" }
		movie = FFMPEG::Movie.new("pleasework.mp4")
		transcoded_movie = movie.transcode("soundtessst.wav",options).audio_codec

		client = Wit::REST::Client.new(token: "ODAT3SALXALVSHVJLXQTVGNB7HCES4EH")
		session = client.session
		results = session.send_sound_message("soundtessst.wav")

		stringOut = Array(results).to_s
		stringOut = stringOut[stringOut.index("t\"=>\"")+5..-1]
		stringOut = stringOut[0...stringOut.index("\"")]
		return stringOut
	end

end
