require 'highline/import'
require 'ghost/manager/ghost_file'

module Ghost
  module Manager

    class ThemeGenerator

      def initialize
        @ghost_file = Ghost::Manager::GhostFile.new

        unless @ghost_file.exists?
          say "<%= color('Unable to find ghostfile', :red, :bold) %>"
          raise Exception.new "Missing ghostfile"
        end
      end

      def generate theme = nil
        theme_name = theme
        theme_name = ask "What do you want your theme to be called? " if theme_name.nil?
        temp = File.join Dir.pwd, theme_name

        # Install yeoman
        puts ""
        say "<%= color('Installing Yeoman dependencies...', :light_blue, :bold) %>"
        system "npm install -g yo bower grunt-cli gulp"

        # Run generator
        puts ""
        say "<%= color('Running yeoman generator ghost-interface...', :light_blue, :bold) %>"
        system "yo ghost-interface #{theme_name}"

        @ghost_file.set_default_theme theme_name
      end

    end

  end
end
