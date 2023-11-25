# frozen_string_literal: true

require 'rails_helper'

describe Representative, type: :model do
  describe '.civic_api_to_representative_params' do
    before do
      @rep_info = instance_double(Google::Apis::CivicinfoV2::RepresentativeInfoResponse)
      @existing_representative = described_class.create(name: 'name', ocdid: 0, title: 'title')
      allow(described_class).to receive(:create!).and_call_original
    end

    context 'when representative is already in database' do
      before do
        allow(@rep_info).to receive(:officials).and_return([OpenStruct.new(name: @existing_representative.name)])
        offices_object = OpenStruct.new(name: @existing_representative.title,
                                        division_id: @existing_representative.ocdid, official_indices: [0])
        allow(@rep_info).to receive(:offices).and_return([offices_object])
      end

      it 'does not create a new representative' do
        expect do
          described_class.civic_api_to_representative_params(@rep_info)
        end.not_to change(described_class, :count)
      end
    end

    context 'when searching for a new representative' do
      before do
        @new_representative = OpenStruct.new(name: 'new name', ocdid: 1, title: 'new title')
        allow(@rep_info).to receive(:officials).and_return([OpenStruct.new(name: @new_representative.name)])
        new_offices_object = OpenStruct.new(name: @new_representative.title,
                                            division_id: @new_representative.ocdid, official_indices: [0])
        allow(@rep_info).to receive(:offices).and_return([new_offices_object])
      end

      it 'creates a new representative' do
        expect do
          described_class.civic_api_to_representative_params(@rep_info)
        end.to change(described_class, :count).by(1)
      end
    end
  end
end
