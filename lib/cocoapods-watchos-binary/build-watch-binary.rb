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
      SANDBOX_DIRECTORY = 'Pods-watchOS'
      WATCH_PODFILE_PATH = SANDBOX_DIRECTORY + '/Podfile-watchOS'

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

        # override sandbox path
        config.sandbox_root = config.installation_root + BuildWatchBinary::SANDBOX_DIRECTORY

        # override podfile
        podfile = Podfile.from_file(podfile_path)
        config.podfile = podfile

        # override pod lockfile path
        config.instance_variable_set("@lockfile_path".to_sym, lockfile_path)

        # create sandbox installer
        installer = installer_for_config
        installer.repo_update = repo_update?(:default => false)
        installer.update = false
        sandbox = Pod::PrebuildSandbox.from_standard_sandbox(installer.sandbox)
        sandbox.specifications_root.mkdir unless sandbox.specifications_root.exist?
        podfile = installer.podfile
        lockfile = installer.lockfile

        UI.puts "podfile: #{podfile.defined_in_file}"
        UI.puts "lockfile: #{lockfile.defined_in_file}" unless lockfile.nil?

        binary_installer = Pod::Installer.new(sandbox, podfile, lockfile)
        binary_installer.prebuild_watch_frameworks!
      end
    end

    private
    def podfile_path
      Pathname.new(config.installation_root + BuildWatchBinary::WATCH_PODFILE_PATH)
    end

    def lockfile_path
      Pathname.new(config.installation_root + BuildWatchBinary::SANDBOX_DIRECTORY + 'Podfile.lock')
    end

    def verify_watch_podfile_exists!
      path = podfile_path
      unless path.exist?
        raise Informative, "#{BuildWatchBinary::WATCH_PODFILE_PATH} not found in installation directory"
      end
    end

  end
end