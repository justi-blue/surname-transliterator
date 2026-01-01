require "bundler/setup"
require "surname/transliterator"

RSpec.describe Surname::Transliterator do
  describe ".polish_to_lithuanian" do
    it "transliterates Łukasiewicz to Lukasiewicz" do
      expect(described_class.polish_to_lithuanian("Łukasiewicz")).to eq([ "Lukasiewicz" ])
    end

    it "transforms Antonowicz to Antonowicz and Antanavicius" do
      expect(described_class.polish_to_lithuanian("Antonowicz")).to eq([ "Antonowicz", "Antonavičius" ])
    end
  end

  describe ".lithuanian_to_polish" do
    it "transforms Jankauskas to Jankauskas and Jankowski" do
      expect(described_class.lithuanian_to_polish("Jankauskas")).to eq([ "Jankauskas", "Jankowski" ])
    end
  end

  describe ".transliterate" do
    it "removes Polish diacritics" do
      expect(described_class.transliterate("Świętochowski", 'polish')).to eq("Swietochowski")
    end

    it "transliterates Russian" do
      expect(described_class.transliterate("Иванов", 'russian')).to eq("Ivanov")
    end
  end

  describe ".transform_ending" do
    it "changes owicz to avičius" do
      expect(described_class.transform_ending("Antonowicz", 'polish', 'lithuanian')).to eq("Antonavičius")
    end
  end
end
