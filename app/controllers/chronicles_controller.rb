class ChroniclesController < ApplicationController
  before_action :authenticate_user!

  # GET /chronicles or /chronicles.json
  def index
    @transactions = Chronicle.all
    @categories = Group.all
  end

  # GET /chronicles/1 or /chronicles/1.json
  def show
    # Transactions per category
    @group_id = params[:id]
    @transactions_per_group = Chronicle.where(group_id: @group_id).order(created_at: :desc)
    @category_name = Group.find(@group_id).name

    # Sum of amount of transactions in each category
    @sum = Chronicle.where(group_id: @group_id).sum(:amount)
  end

  # GET /chronicles/new
  def new
    @chronicle = Chronicle.new
  end

  # POST /chronicles or /chronicles.json
  def create
    @chronicle = Chronicle.new(author_id: current_user.id, **chronicle_params)

    respond_to do |format|
      if @chronicle.save
        format.html { redirect_to user_groups_url, notice: 'Transaction was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chronicles/1 or /chronicles/1.json
  def destroy
    if @chronicle.destroy
      respond_to do |format|
        format.html { redirect_to user_chronicles_url, notice: 'Chronicle was successfully destroyed.' }
      end
    else
      puts 'Not deleted'
      flash.now[:error] = 'Unable to delete chronicle.'
    end
  end

  # Only allow a list of trusted parameters through.
  def chronicle_params
    params.require(:chronicle).permit(:name, :amount, :group_id)
  end
end
