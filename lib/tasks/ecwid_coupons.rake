namespace :donation_roll_ups do
  namespace :ecwid do
    desc "Activate coupon codes for DonationRollUps"
    task :activate_coupons => :environment do
      DonationRollUp.where(ecwid_discount_coupon_id: nil).where("ecwid_discount_coupon_amount > 0").find_each do |dru|
        EcwidDiscountCouponCreator.call(dru)
      end
    end
  end
end
