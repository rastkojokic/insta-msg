require "spec_helper"

describe Dialect::Yoda do
  describe "#translate_message" do
    let(:message_text) { "Hello, how are you doing!" }

    before do
      @yoda_dialect = Dialect::Yoda.new
      @translated_message = @yoda_dialect.translate_message(message_text)
    end

    it "returns message with words not in the original order" do
      expect(@translated_message).not_to eq(message_text)
    end

    it "returns message containing all the words from original message" do
      expect(@translated_message).to include("Hello")
      expect(@translated_message).to include(",")
      expect(@translated_message).to include("how")
      expect(@translated_message).to include("are")
      expect(@translated_message).to include("you")
      expect(@translated_message).to include("doing")
      expect(@translated_message).to include("!")
    end
  end
end
