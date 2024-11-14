# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PreponentsController, type: :controller do
  let(:user) { create(:user) }
  let(:preponent) { create(:preponent) }

  before do
    sign_in user
  end

  describe 'GET #calculate_inss' do
    it 'calculates INSS discount for a given salary' do
      salary = 2500.00
      get :calculate_inss, params: { salary: }
      expected_discount = Preponent.calculate_inss_discount(salary)
      expect(response).to have_http_status(:ok)
      expect(response.parsed_body['inss_discount']).to eq(expected_discount)
    end
  end

  describe 'GET #report_by_salary_range' do
    it 'returns a salary report by ranges' do
      get :report_by_salary_range
      expect(response).to be_successful
      expect(assigns(:salary_report)).to be_present
    end
  end

  describe 'PATCH #update_salary_only' do
    it 'updates the salary of the preponent' do
      patch :update_salary_only, params: { id: preponent.id, preponent_id: preponent.id, salary: 3500.00 }
      expect(response).to redirect_to(preponent)
      expect(flash[:notice]).to eq('Salário atualizado com sucesso')
    end
  end

  describe 'GET #show' do
    it 'returns the preponent details' do
      get :show, params: { id: preponent.id }
      expect(response).to be_successful
      expect(assigns(:preponent)).to eq(preponent)
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      let(:valid_params) { { preponent: attributes_for(:preponent) } }

      it 'creates a new preponent' do
        expect do
          post :create, params: valid_params
        end.to change(Preponent, :count).by(1)
        expect(response).to redirect_to(preponents_path(page: 1))
        expect(flash[:notice]).to eq('Funcionário criado com sucesso.')
      end
    end

    context 'with invalid parameters' do
      let(:invalid_params) { { preponent: { name: nil } } }

      it 'does not create a new preponent' do
        expect do
          post :create, params: invalid_params
        end.to change(Preponent, :count).by(0)
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'PATCH #update' do
    context 'with valid parameters' do
      let(:valid_params) { { id: preponent.id, preponent: { name: 'Updated Name' } } }

      it 'updates the preponent' do
        patch :update, params: valid_params
        preponent.reload
        expect(preponent.name).to eq('Updated Name')
        expect(response).to redirect_to(preponents_path(page: 1))
      end
    end

    context 'with invalid parameters' do
      let(:invalid_params) { { id: preponent.id, preponent: { name: nil } } }

      it 'does not update the preponent' do
        patch :update, params: invalid_params
        preponent.reload
        expect(preponent.name).not_to eq(nil)
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested preponent' do
      preponent_to_delete = create(:preponent)
      expect do
        delete :destroy, params: { id: preponent_to_delete.id }
      end.to change(Preponent, :count).by(-1)
      expect(response).to redirect_to(preponents_path(page: 1))
      expect(flash[:notice]).to eq('Funcionário removido com sucesso.')
    end
  end
end
