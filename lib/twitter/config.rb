require 'yaml'

module Twitter
  module Config
    private
    
    def config_file
      File.join(::Rails.root.to_s, "config", "twitter.yaml")
    end
    
    def configuration
      YAML.load(File.read(config_file))
    end
  end
end
