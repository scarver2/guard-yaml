# spec/guard/yaml/version_spec.rb
# frozen_string_literal: true

# Load coverage before application code.
require "spec_helper"
require "guard/yaml/version"

RSpec.describe Guard::YamlVersion do
  describe "VERSION" do
    subject(:version) { described_class::VERSION }

    it "uses a valid semantic version" do
      expect(version).to match(
        /\A\d+\.\d+\.\d+(?:[.-][0-9A-Za-z]+(?:[.-][0-9A-Za-z]+)*)?(?:\+[0-9A-Za-z]+(?:[.-][0-9A-Za-z]+)*)?\z/
      )
      expect(Gem::Version.new(version).to_s).to eq(version)
    end
  end
end
