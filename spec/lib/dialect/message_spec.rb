require "spec_helper"

describe Dialect::Message do
  describe "#words" do
    context "text has only blank spaces" do
      let(:text) { "word_a word_b word_c" }
      let(:expected_array) { ["word_a", "word_b", "word_c"] }

      it "returns array of words from text" do
        message = Dialect::Message.new(text)

        expect(message.words).to eq(expected_array)
      end
    end

    context "text has blank spaces and interpunction signs" do
      let(:text) { "word_a, word_b word_c!" }
      let(:expected_array) { ["word_a", ",", "word_b", "word_c", "!"] }

      it "returns array of words and signs from text" do
        message = Dialect::Message.new(text)

        expect(message.words).to eq(expected_array)
      end
    end
  end
end
