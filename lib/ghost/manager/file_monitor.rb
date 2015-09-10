require 'fssm'
require 'rsync'
require 'highline/import'
require 'ghost/manager/ghost_file'

module Ghost
  module Manager

    class FileMonitor

      def self.start
        instance = self.new
        instance.start_monitoring
        instance
      end

      def initialize
        @ghost_file = Ghost::Manager::GhostFile.new

        unless @ghost_file.exists?
          say "<%= color('Unable to find ghostfile', :red, :bold) %>"
          raise Exception.new "Missing ghostfile"
        end

        sync_files
      end

      def monitor
        theme_dir = File.join Dir.pwd, @ghost_file.ghost_theme
        FSSM.monitor theme_dir, "**/*", directories: true do
          update do |b, r, t|
            sync_files
          end

          create do |b, r, t|
            sync_files
          end

          delete do |b, r, t|
            sync_files
          end
        end
      end

      def start_monitoring
        theme_dir = File.join Dir.pwd, @ghost_file.ghost_theme

        Thread.new {
          FSSM.monitor theme_dir do
            update{ sync_files }
            delete{ sync_files }
            create{ sync_files }
          end
        }
      end

      def sync_files
        say "<%= color('Theme changed, syncing files...', :light_blue, :bold) %>"

        theme_dir = File.join Dir.pwd, @ghost_file.ghost_theme
        ghost_theme_dir = File.join @ghost_file.ghost_path, "content", "themes", @ghost_file.ghost_theme

        Rsync.run theme_dir, ghost_theme_dir do |result|
          if result.success?
            result.changes.each do |change|
              say "   <%= color('#{change.filename}', :yellow) %> <%= color('#{change.summary}', :green) %>"
            end
          else
            say "<%= color('Failed to sync changes: #{result.error}', :red, :bold) %>"
          end

        end
      end
    end

  end
end
