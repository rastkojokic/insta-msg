require "spec_helper"

describe Dialect::ValleyGirl do
  describe "#translate_message" do
    let(:message_text) { "Hello, how are you doing?" }

    it "returns message containing valley girl phrase" do
      dialect = Dialect::ValleyGirl.new

      expect(dialect.translate_message(message_text)).to include(Dialect::ValleyGirl::PHRASE)
    end
  end
end
