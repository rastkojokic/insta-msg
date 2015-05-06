require "spec_helper"

describe Translation do
  describe "#translate" do
    context "message is written in Pirate dialect" do
      let(:message) { "This is a simple message!" }
      let(:pirate_message) { "Dis be a simple message !" }

      it "translates message to pirate dialect" do
        translation = Translation.new("pirate", message)
        
        expect(translation.translate).to eq(pirate_message)
      end
    end

    context "message is written in Yoda dialect" do
      let(:message) { "This is a simple message!" }

      it "translates message to yoda dialect" do
        translation = Translation.new("yoda", message)
        
        expect(translation.translate).not_to eq(message)
      end
    end

    context "message is written in Valley Girl dialect" do
      let(:message) { "This is a simple message!" }

      it "translates message to valley girl dialect" do
        translation = Translation.new("valley_girl", message)
        
        expect(translation.translate).to include("like")
      end
    end
  end
end
