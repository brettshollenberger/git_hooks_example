require "rake"
require_relative "./base_hook"

module PreCommitHooks
  class PryFinder < BaseHook
    def execute
      if prys_found.empty?
        return 0
      else
        sh find_cmd
        return 1
      end
    end

    private

    def prys_found
      `#{find_cmd} | wc | grep -v 0`
    end

    def find_cmd
      "cd #{ENV["HOME"]}/carrot && ag binding.pry"
    end
  end
end
