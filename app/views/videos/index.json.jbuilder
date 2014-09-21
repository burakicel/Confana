json.array!(@videos) do |video|
  json.extract! video, :id, :url, :name, :content, :description, :thumbnail
  json.url video_url(video, format: :json)
end
