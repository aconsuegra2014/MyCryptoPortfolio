class CryptoCurrenciesController < ApplicationController
  before_action :set_crypto_currency, only: %i[ show edit update destroy ]

  # GET /crypto_currencies or /crypto_currencies.json
  def index
    @crypto_currencies = CryptoCurrency.all
  end

  # GET /crypto_currencies/1 or /crypto_currencies/1.json
  def show
  end

  # GET /crypto_currencies/new
  def new
    @crypto_currency = CryptoCurrency.new
  end

  # GET /crypto_currencies/1/edit
  def edit
  end

  # POST /crypto_currencies or /crypto_currencies.json
  def create
    @crypto_currency = CryptoCurrency.new(crypto_currency_params)

    respond_to do |format|
      if @crypto_currency.save
        format.html { redirect_to @crypto_currency, notice: "Crypto currency was successfully created." }
        format.json { render :show, status: :created, location: @crypto_currency }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @crypto_currency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /crypto_currencies/1 or /crypto_currencies/1.json
  def update
    respond_to do |format|
      if @crypto_currency.update(crypto_currency_params)
        format.html { redirect_to @crypto_currency, notice: "Crypto currency was successfully updated." }
        format.json { render :show, status: :ok, location: @crypto_currency }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @crypto_currency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /crypto_currencies/1 or /crypto_currencies/1.json
  def destroy
    @crypto_currency.destroy
    respond_to do |format|
      format.html { redirect_to crypto_currencies_url, notice: "Crypto currency was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crypto_currency
      @crypto_currency = CryptoCurrency.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def crypto_currency_params
      params.require(:crypto_currency).permit(:name, :ticker_symbol)
    end
end
