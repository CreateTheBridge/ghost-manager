require "ghost/manager/version"
require "highline/import"

module Ghost
  module Manager

    class Installer
      attr_accessor :install_directory


      def initialize install_path
        self.install_directory = File.expand_path install_path
      end

      def install
        # Make sure directory exists
        if Dir.exists? install_directory
          say "<%= color('Directory exists, removing directory and recreating...', :bold, :yellow) %>"
          system 'rm', '-rf', install_directory
        end

        # Create the directory
        system 'mkdir', '-p', install_directory

        say "<%= color('Cloning latest ghost version', :bold, :light_blue) %>"
        puts ""

        # Clone the latest version of ghost from github
        system "cd #{install_directory} && git clone https://github.com/TryGhost/Ghost.git ."

        puts ""
        say "<%= color('Installing node modules', :bold, :light_blue) %>"
        puts ""
        # Install packages
        system "cd #{install_directory} && npm install"
      end

      def update_install
        say "<%= color('Updating ghost install...', :light_blue, :bold) %>"
        puts ""

        system "cd #{install_directory} && git stash && git pull && git stash pop"

        puts ""
        say "<%= color('Installing new node modules...', :light_blue, :bold) %>"
        puts ""

        system "cd #{install_directory} && npm install"
      end


      def generate_theme
        # Make sure Yeoman is ready to roll
        say "<%= color('Installing Yeoman...', :light_blue, :bold) %>"
        system "npm install -g yo bower grunt-cli gulp"



      end

    end

  end
end
