require "rake"
require "thor"
require_relative "./base_hook"

module PreCommitHooks
  class CatalogRemover < BaseHook
    def execute
      RemoverRunner.new.execute
    end

    class RemoverRunner< Thor
      include Thor::Actions

      destination_root = File.expand_path(File.join(__FILE__, "../../../instacart"))

      def execute
        gsub_file "instacart/app/models/scan_code.rb", /require_dependency CatalogCore::Engine.root.join('app', 'models', 'scan_code').to_s\n/, ""
        gsub_file "instacart/app/models/inventory_area.rb", /require_dependency CatalogCore::Engine.root.join('app', 'models', 'inventory_area').to_s\n/, ""
      end
    end
  end
end

