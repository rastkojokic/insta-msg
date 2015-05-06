require "spec_helper"

describe Dialect::Pirate do
  describe "#translate_message" do
    let(:message_text) { "Hello, how are you doing!" }
    let(:expected_translated_message) { "Ahoy , how be ye doing !" }

    it "returns word translated to pirate dialect" do
      pirate_dialect = Dialect::Pirate.new

      expect(pirate_dialect.translate_message(message_text)).to eq(expected_translated_message)
    end
  end
end
