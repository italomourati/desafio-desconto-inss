# frozen_string_literal: true

class PreponentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_preponent, only: %i[show edit update destroy]

  def calculate_inss
    salary = params[:salary].to_f

    inss_discount = Preponent.calculate_inss_discount(salary)

    render json: { inss_discount: }
  end

  def report_by_salary_range
    salary_ranges = [
      { name: 'Até R$ 1.045,00', min: 0, max: 1045 },
      { name: 'De R$ 1.045,01 a R$ 2.089,60', min: 1045.01, max: 2089.60 },
      { name: 'De R$ 2.089,61 a R$ 3.134,40', min: 2089.61, max: 3134.40 },
      { name: 'De R$ 3.134,41 a R$ 6.101,06', min: 3134.41, max: 6101.06 }
    ]

    @salary_report = salary_ranges.map do |range|
      {
        range: range[:name],
        count: Preponent.where(salary: range[:min]..range[:max]).count
      }
    end

    @labels = @salary_report.pluck(:range)
    @counts = @salary_report.pluck(:count)
  end

  def update_salary_only
    preponent = Preponent.find(params[:id])

    if preponent.nil?
      redirect_to preponents_path, alert: 'Preponente não encontrado'
      return
    end

    new_salary = params[:salary].to_f

    if new_salary <= 0
      redirect_to preponent, alert: 'O salário informado não é válido'
      return
    end

    UpdateSalaryJob.perform_later(preponent.id, new_salary)

    redirect_to preponent, notice: 'Salário atualizado com sucesso'
  end

  def index
    @total_pages = (Preponent.count / 5.0).ceil
    @page = params[:page].to_i || 1
    @preponents = Preponent.order(:name).page(@page)
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
        format.html { redirect_to preponents_path(page: 1), notice: 'Funcionário criado com sucesso.' }
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
        format.html { redirect_to preponents_path(page: 1), notice: 'Funcionário atualizado com sucesso.' }
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
      format.html do
        redirect_to preponents_path(page: 1), status: :see_other, notice: 'Funcionário removido com sucesso.'
      end
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
