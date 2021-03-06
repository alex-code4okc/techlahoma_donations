class Admin::DonationRollUpsController < Admin::AdminController
  before_action :set_donation_roll_up, only: [:show, :edit, :update, :destroy]

  # GET /donation_roll_ups
  # GET /donation_roll_ups.json
  def index
    @donation_roll_ups = DonationRollUp.all.order("amount desc")
  end

  def csv
    @donation_roll_ups = DonationRollUp.all.order("amount desc")
    response.headers['Content-Type'] = 'text/csv'
    response.headers['Content-Disposition'] = 'attachment; filename=techlahoma_donation_roll_ups.csv'
    render text: @donation_roll_ups.to_csv
  end

  # GET /donation_roll_ups/1
  # GET /donation_roll_ups/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_donation_roll_up
      @donation_roll_up = DonationRollUp.find_by_guid(params[:id])
    end

end
