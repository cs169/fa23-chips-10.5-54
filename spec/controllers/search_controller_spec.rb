# frozen_string_literal: true

require 'rails_helper'

describe SearchController, type: :controller do
  describe 'GET search' do
    before do
      @fake_response = instance_double(Google::Apis::CivicinfoV2::RepresentativeInfoResponse)
      @fake_address = 'fake address'
      @fake_service = instance_double(Google::Apis::CivicinfoV2::CivicInfoService)

      allow(Google::Apis::CivicinfoV2::CivicInfoService).to receive(:new).and_return(@fake_service)
      allow(@fake_service).to receive(:representative_info_by_address).and_return(@fake_response)
      allow(@fake_service).to receive(:key=)
      allow(Rails.application.credentials).to receive(:[]).with(:GOOGLE_API_KEY)
      allow(Representative).to receive(:civic_api_to_representative_params).with(@fake_response)
    end

    it 'gets representative info with the provided address' do
      get :search, params: { address: @fake_address }
      expect(@fake_service).to have_received(:representative_info_by_address).with(address: @fake_address)
    end

    it 'renders the representatives/search template' do
      get :search, params: { address: @fake_address }
      expect(response).to render_template('representatives/search')
    end
  end
end
