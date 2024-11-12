# frozen_string_literal: true

class PreponentsController < ApplicationController
  before_action :set_preponent, only: %i[show edit update destroy]

  def calculate_inss
    salary = params[:salary].to_f

    inss_discount = Preponent.calculate_inss_discount(salary)

    render json: { inss_discount: }
  end

  def index
    @preponents = Preponent.all
  end

  def show; end

  # GET /preponents/new
  def new
    @preponent = Preponent.new
  end

  def edit; end

  def create
    @preponent = Preponent.new(preponent_params)

    respond_to do |format|
      if @preponent.save
        format.html { redirect_to @preponent, notice: 'Preponent was successfully created.' }
        format.json { render :show, status: :created, location: @preponent }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @preponent.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @preponent.update(preponent_params)
        format.html { redirect_to @preponent, notice: 'Preponent was successfully updated.' }
        format.json { render :show, status: :ok, location: @preponent }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @preponent.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @preponent.destroy!

    respond_to do |format|
      format.html { redirect_to preponents_path, status: :see_other, notice: 'Preponent was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_preponent
    @preponent = Preponent.find(params[:id])
  end

  def preponent_params
    params.require(:preponent).permit(:name, :cpf, :birth_date, :address, :number, :neighborhood, :city, :state,
                                      :postal_code, :personal_phone, :reference_phone, :salary, :inss_discount)
  end
end
