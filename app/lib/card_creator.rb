class CardCreator
  AUDIO_SERVICE_URL = 'http://soundoftext.com/static/sounds'
  TRANSLATE_SERVICE_URL = 'https://translate.googleapis.com/translate_a/single?client=gtx&sl=en&tl='

  def initialize(topic, image)
    @topic    = topic
    @image    = image
    @language = topic.language
    @text     = nil
    @audio    = nil
  end

  def perform
    Card.create(card_attrs)
  end

  def card_attrs
    {
      language: @language,
      topic: @topic,
      content_attributes: [text: text, audio: audio],
      image_attributes: [image: @image]
    }
  end

  def text
    return @text if @text
    image_name = File.basename(@image.original_filename, '.*')
    translation_data = open("#{TRANSLATE_SERVICE_URL}#{@language.slug}&dt=t&q=#{URI::encode(image_name)}").read

    #TODO Parse an attachment as JSON
    @text = translation_data.split(',').first.delete('["')
  end

  #TODO Replace with AddressableURI
  def audio
    @audio ||= open("#{AUDIO_SERVICE_URL}/#{@language.slug}/#{URI::encode(@text)}.mp3").read
  end
end
