module Pod
  class Command
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
        installer_context = installer_for_config
        # install
        podfile = installer_context.podfile
        sandbox = installer_context.sandbox
        prebuild_podfile = Pod::Podfile.from_ruby(podfile.defined_in_file)
        lockfile = installer_context.lockfile

        binary_installer = Pod::Installer.new(sandbox, prebuild_podfile, lockfile)
        UI.puts "Sandbox manifest path: #{sandbox.project_path}"
        binary_installer.prebuild_frameworks!
        # binary_installer.install!
      end
    end
  end
end
