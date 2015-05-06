require "spec_helper"

describe Dialect do
  describe "#translate_message" do
    it "raises not implemented error" do
      expect { Dialect.new.translate_message(double) }.to raise_error(NotImplementedError)
    end
  end
end
