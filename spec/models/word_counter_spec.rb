# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WordCounter, type: :model do
  describe  '.count' do
    subject { WordCounter.new.count(text) }
    context 'when text is empty' do
      let(:text) { '' }
      it { expect { subject }.to raise_error(/Text is required/) }
    end
    context 'with text "Loren ipsun ipsun"' do
      let(:text) { 'Loren ipsun ipsun' }
      it { is_expected.to eq 3 }
    end
    context 'with space at the end' do
      let(:text) { 'Loren ipsun ipsun  ' }
      it { is_expected.to eq 3 }
    end
    context 'with space at the beginning' do
      let(:text) { '   Loren ipsun ipsun loren' }
      it { is_expected.to eq 4 }
    end
    context 'with \t separation ' do
      let(:text) { "Loren\tipsun\tipsun" }
      it { is_expected.to eq 3 }
    end
    context 'with \n separation ' do
      let(:text) { "Loren\nipsun\nipsun" }
      it { is_expected.to eq 3 }
    end
    context 'with many spaces separation' do
      let(:text) { 'Loren   ipsun   ipsun' }
      it { is_expected.to eq 3 }
    end
  end
end
