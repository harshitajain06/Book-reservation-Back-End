require 'rails_helper'

RSpec.describe 'Reservations', type: :request do
  describe 'GET /index' do
    before(:example) do
      @user = User.create(name: 'Dev')
      @reservation = Reservation.create(user_id: @user.id, restaurant_table_id: 3, city: 'Agra',
                                        start_date: '15/05/2023', end_date: '16/05/2023', table_name: 'Table6')
      get api_v1_reservations_path(@reservation)
    end

    it 'returns a successful response' do
      get api_v1_reservations_path(@reservation)
      expect(response).to be_successful
    end

    it 'text in response body' do
      get api_v1_reservations_path(@reservation)
      expect(response.body).to include('[]')
    end
  end

  describe 'GET /show' do
    before(:example) do
      @user = User.create(name: 'Dev')
      @reservation = Reservation.create(user: @user, city: 'Agra', start_date: '15/05/2023',
                                        end_date: '16/05/2023', table_name: 'Table6')
      get api_v1_reservations_path(@user, @reservation)
    end

    it 'returns a successful response' do
      get api_v1_reservations_path(@user, @reservation)
      expect(response).to be_successful
    end

    it 'text in response body' do
      get api_v1_reservations_path(@user, @reservation)
      expect(response.body).to include('[]')
    end
  end
end
