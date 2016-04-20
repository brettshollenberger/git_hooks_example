require "rake"
require_relative "./base_hook"

module PreCommitHooks
  class SyntaxChecker < BaseHook
    def execute
      if focuses_found.empty?
        return 0
      else
        sh find_cmd
        return 1
      end
    end

    private

    def focuses_found
      `#{find_cmd} | wc | grep -v 0`
    end

    def find_cmd
      "cd #{ENV["HOME"]}/carrot/instacart/spec && ag focus --ignore rails_helper.rb --ignore spec_helper.rb --ignore teaspoon_env.rb"
    end
  end
end
