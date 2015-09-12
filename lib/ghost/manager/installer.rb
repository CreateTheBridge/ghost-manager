require "highline/import"

module Ghost
  module Manager

    class Installer
      attr_accessor :install_directory


      def initialize install_path
        self.install_directory = File.expand_path install_path
      end

      def install
        # Directory exists and is not empty
        if Dir.exists? install_directory and Dir.entries(install_directory).select{|x| ![".", ".."].include? x}.any?
          say "<%= color('Directory already exists and is not empty', :yellow, :bold) %>"
          result = ask "<%= color('Do you want to replace it? (y/n)') %>"

          if result == "y"
            system 'rm', '-rf', install_directory
            system 'mkdir', '-p', install_directory
          else
            return
          end
        else
          # Create the directory
          system 'mkdir', '-p', install_directory
        end


        say "<%= color('Cloning latest ghost version', :bold, :light_blue) %>"
        puts ""

        # Clone the latest version of ghost from github
        system "cd #{install_directory} && git clone https://github.com/TryGhost/Ghost.git ."

        puts ""
        say "<%= color('Installing node modules', :bold, :light_blue) %>"
        puts ""
        # Install packages
        system "cd #{install_directory} && npm install"

        # Build ember stuff
        puts ""
        say "<%= color('Building ember componenets...', :bold, :light_blue) %>"
        puts ""

        system "cd #{install_directory} && grunt init"
      end

      def update_install
        say "<%= color('Updating ghost install...', :light_blue, :bold) %>"
        puts ""

        system "cd #{install_directory} && git stash && git pull && git stash pop"

        puts ""
        say "<%= color('Installing new node modules...', :light_blue, :bold) %>"
        puts ""

        system "cd #{install_directory} && npm install"

        # Build ember stuff
        puts ""
        say "<%= color('Building ember componenets...', :bold, :light_blue) %>"
        puts ""

        system "cd #{install_directory} && grunt init"
      end


      def generate_theme
        # say "<%= color('Sorry, this does not quite work yet', :red, :bold) %>"
        # Make sure Yeoman is ready to roll
        # say "<%= color('Installing Yeoman...', :light_blue, :bold) %>"
        # system "npm install -g yo bower grunt-cli gulp"



      end

    end

  end
end
