module Pod
  class Command
    include RepoUpdate
    include ProjectDirectory
    # This is an example of a cocoapods plugin adding a top-level subcommand
    # to the 'pod' build-watch-binary.
    #
    # You can also create subcommands of existing or new commands. Say you
    # wanted to add a subcommand to `list` to show newly deprecated pods,
    # (e.g. `pod list deprecated`), there are a few things that would need
    # to change.
    #
    # - move this file to `lib/pod/build-watch-binary/list/deprecated.rb` and update
    #   the class to exist in the the Pod::Command::List namespace
    # - change this class to extend from `List` instead of `Command`. This
    #   tells the plugin system that it is a subcommand of `list`.
    # - edit `lib/cocoapods_plugins.rb` to require this file
    #
    # @todo Create a PR to add your plugin to CocoaPods/cocoapods.org
    #       in the `plugins.json` file, once your plugin is released.
    #
    class BuildWatchBinary < Command
      WATCH_PODFILE_NAME = "Podfile_watchOS"

      self.summary = 'Build the watch binary framework files'

      self.description = <<-DESC
        Build the framework binaries for target in Podfile-WatchOS
      DESC

      #self.arguments = 'NAME'

      def initialize(argv)
        # @name = argv.shift_argument
        super
      end

      def validate!
        super
        # help! 'A Pod name is required.' unless @name
      end

      def run
        UI.puts "Running BuildWatchBinary"
        require_relative 'helper/prebuild_sandbox'
        require_relative 'Prebuild'

        verify_watch_podfile_exists!

        podfile = Podfile.from_file(podfile_path)
        config.podfile = podfile

        # create sandbox installer
        installer = installer_for_config
        installer.repo_update = repo_update?(:default => false)
        installer.update = false
        sandbox = Pod::PrebuildSandbox.from_standard_sandbox(installer.sandbox)
        podfile = installer.podfile
        lockfile = installer.lockfile

        binary_installer = Pod::Installer.new(sandbox, podfile, lockfile)
        binary_installer.prebuild_watch_frameworks!
      end
    end

    private
    def podfile_path
      Pathname.new(config.installation_root + BuildWatchBinary::WATCH_PODFILE_NAME)
    end

    def verify_watch_podfile_exists!
      path = podfile_path
      unless path.exist?
        raise Informative, "#{BuildWatchBinary::WATCH_PODFILE_NAME} not found in installation directory"
      end
    end

  end
end