require "rake"
require_relative "./base_hook"

module PreCommitHooks
  class RubocopAutocorrector < BaseHook
    def execute
      begin
        sh cop_cmd
      rescue
        0
      end
    end

    private

    def cop_cmd
      "git diff --name-only --cached | xargs rubocop -a"
    end
  end
end
