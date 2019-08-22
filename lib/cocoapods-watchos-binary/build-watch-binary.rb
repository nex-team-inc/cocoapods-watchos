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

        verify_podfile_exists!

        # create sandbox installer
        installer = installer_for_config
        installer.repo_update = repo_update?(:default => false)
        installer.update = false
        sandbox = Pod::PrebuildSandbox.from_standard_sandbox(installer.sandbox)
        podfile = installer.podfile
        lockfile = installer.lockfile

        binary_installer = Pod::Installer.new(sandbox, podfile, lockfile)
        # binary_installer.validate_targets
        # binary_installer.generate_pods_project
        binary_installer.prebuild_watch_frameworks!
        # installer.deployment = @deployment
        # installer.clean_install = @clean_install
        # installer.install!
        #
        #
        # installer_context = installer_for_config
        # # install
        # podfile = installer_context.podfile
        # sandbox = Pod::PrebuildSandbox.from_standard_sandbox(installer_context.sandbox)
        # prebuild_podfile = Pod::Podfile.from_ruby(podfile.defined_in_file)
        # lockfile = installer_context.lockfile
        #
        # Pod::UI.puts "🚀 Prebuild frameworks with podfile: #{podfile} and prebuild: #{prebuild_podfile}"
        #
        # binary_installer = Pod::Installer.new(sandbox, prebuild_podfile, lockfile)
        # Pod::UI.puts "Sandbox manifest path: #{sandbox.project_path}"
        # binary_installer.prebuild_frameworks!
        # # binary_installer.install!
      end
    end
  end
end