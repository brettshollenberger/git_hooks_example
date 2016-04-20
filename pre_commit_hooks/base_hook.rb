require "rake"

module PreCommitHooks
  class BaseHook
    include Rake::DSL

    attr_accessor :disabled

    def initialize(options = {})
      @disabled = options.fetch(:disabled, false)
    end

    def _execute
      if enabled?
        puts "Executing #{self.class.name}"

        execute
      else
        puts "Skipping #{self.class.name}"

        0
      end
    end

    def disabled?
      !!disabled
    end

    def enabled?
      !disabled?
    end
  end
end
