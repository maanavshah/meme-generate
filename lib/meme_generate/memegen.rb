require 'unirest'
require 'logger'

#
# Module Memegen provides free api driver for https://memegen.link/
#
# @author Maanav Shah <shah.maanav.07@gmail.com>
#
module Memegen
  attr_accessor :font, :height, :width, :share

  #
  # Initializes reserved_characters that replaces special characters
  #
  #
  # @return Hash reserved_characters to substitute
  #
  def reserved_characters
    @reserved_characters ||= {
      '_': '__',
      '-': '--',
      ' ': '-',
      '?': '~q',
      '%': '~p',
      '#': '~h',
      '/': '~s',
      '"': "''"
    }
  end

  #
  # Initializes logger
  #
  #
  # @return Logger Logger instancce
  #
  def logger
    @logger ||= Logger.new(STDOUT)
  end

  #
  # Get the list of fonts
  #
  #
  # @return Array List of fonts
  #
  def list_fonts
    response = Unirest.get('https://memegen.link/api/fonts')
    response.body
  end

  #
  # Generate the meme using title, caption and image url
  #
  # @param String title A title for the image
  # @param String caption A caption for the image
  # @param String image An url for image
  #
  # @return File An image
  #
  def generate(title, caption, image)
    # check if title, caption and image is present and valid
    invalid = false
    if title.nil? || title.empty?
      logger.error('Empty title detected')
      invalid = true
    end
    if caption.nil? || caption.empty?
      logger.error('Empty caption detected')
      invalid = true
    end
    url = image.match(/.*(?=\.)/)
    if url.nil? || !image_exists?(url[0])
      logger.error('Image not found')
      invalid = true
    end

    unless invalid
      # Replace the reserve words
      reserved_characters.each { |k, v| title.gsub!(k.to_s, v.to_s) }
      reserved_characters.each { |k, v| caption.gsub!(k.to_s, v.to_s) }

      # Generate the url
      url = "https://memegen.link/custom/#{title}/#{caption}.jpg?alt=#{image}"

      # Parameters
      options = {}
      options[:font] = @font if list_fonts.include?(@font)
      options[:width] = @width.to_i if @width.to_i > 100
      options[:height] = @height.to_i if @height.to_i > 100
      options[:share] = (@share == true)
      options.reject! { |_k, v| v.empty? }
      response = if options.empty? || options.nil?
                   Unirest.get(url)
                 else
                   Unirest.get(url, parameters: options)
                 end

      # Writing image
      File.open("#{Time.now.to_i}.jpeg", 'w+') do |f|
        f.write(response.body)
        f.close
      end
      logger.info('Meme generated')
    end
  end

  private

  #
  # Check if the image exists on remote URL
  #
  # @param  url A remote image url
  #
  # @return boolean true/false if the image exists or not
  #
  def image_exists?(url)
    uri = URI(url)
    request = Net::HTTP.new uri.host
    response = request.request_head(uri.path)
    [200, 301].include?(response.code.to_i)
  end
end
