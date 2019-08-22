# cocoapods-watchos-binary

A cocoapods plugin with the intention to prebuild framework binaries for WatchOS without intefering with cocoapods-binary.

## Creation

A cocoapod plugin template is created by:

    $ pod plugins create PLUGIN_NAME

# Local Testing
## Build the current changes
    1. Modify the gem version in `gem_version.rb`
    2. Build the new gem
        $ gem build cocoapods-watchos-binary

## Installation

    $ gem install cocoapods-watchos-binary