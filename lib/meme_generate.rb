require_relative "meme_generate/version"
require_relative "meme_generate/memegen"

#
# Module MemeGenerate provides interface as a ruby client for https://memegen.link/
#
# @author Maanav Shah <shah.maanav.07@gmail.com>
#
module MemeGenerate
end

# extend Memgen module that directly allows to access methods
extend Memegen
