require 'erb'
require 'json'
require 'highline/import'

module Ghost
  module Manager

    class GhostFile
      attr_accessor :path, :content

      def self.create dir
        @ghost_directory = dir
        @template = File.read "#{Dir.pwd}/lib/ghost/templates/ghostfile.json.erb"
        erb = ERB.new(@template).result binding
        File.write File.join(Dir.pwd, "ghostfile.json"), erb
        self.new
      end

      def initialize
        self.path = "#{Dir.pwd}/ghostfile.json"
        load_content
      end

      def exists?
        File.exists? path
      end

      def theme_installed?
        !content["ghost-theme"].nil?
      end

      def load_content
        unless !exists?
          self.content = JSON.parse File.read(path)
        end
      end

      def ghost_path
        content["ghost-installation"]
      end

      def ghost_theme
        content["ghost-theme"]
      end

      def set_default_theme theme
        unless content.nil?
          content["ghost-theme"] = theme
          save
        end
      end

      def save
        unless content.nil?
          json = JSON.pretty_generate(content)
          File.write path, json
        end
      end

    end

  end
end
