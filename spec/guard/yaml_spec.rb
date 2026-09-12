# spec/guard/yaml_spec.rb
# frozen_string_literal: true

# Load coverage before application code.
require "spec_helper"
require "guard/yaml"

RSpec.describe Guard::Yaml do
  subject(:plugin) { described_class.allocate }

  let(:fixtures) { File.expand_path("../fixtures", __dir__) }

  it "loads as a current Guard plugin" do
    expect(described_class).to be < Guard::Plugin
    expect(described_class.non_namespaced_name).to eq("yaml")
  end

  it "accepts valid YAML without output" do
    expect { plugin.run_on_changes([File.join(fixtures, "valid.yml")]) }.not_to output.to_stdout
  end

  it "reports malformed YAML" do
    expect { plugin.run_on_changes([File.join(fixtures, "invalid.yml")]) }
      .to output(/Psych::SyntaxError:/).to_stdout
  end
end
