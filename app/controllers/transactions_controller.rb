class TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[ show edit update destroy ]
  before_action :set_crypto_currencies, only: %i[ new create edit ]

  # GET /transactions or /transactions.json
  def index
    @filter = {}
    @filter[:tag] = ActsAsTaggableOn::Tag.pluck(:name)
    @filtered = params[:filter]
    unless params[:filter].nil?
    @pagy, @transactions = pagy (Transaction.joins(:crypto_currency).tagged_with params[:filter] )
    else
      @pagy, @transactions = pagy (Transaction.joins(:crypto_currency) )
    end
    @crypto_currencies = CryptoCurrency.joins(:transactions).group(:crypto_currency_id)
  end

  # GET /transactions/1 or /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions or /transactions.json
  def create
    @transaction = Transaction.new(transaction_params)

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to @transaction, notice: "Transaction was successfully created." }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1 or /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: "Transaction was successfully updated." }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1 or /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: "Transaction was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    def set_crypto_currencies
      @crypto_currencies = CryptoCurrency.pluck(:name, :id)
    end
    # Only allow a list of trusted parameters through.
    def transaction_params
      params.require(:transaction).permit(:crypto_quantity, :fiat_quantity, :date, :crypto_currency_id, :note, :tag_list)
    end
end
