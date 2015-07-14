require 'spec_helper'

describe "Create payment on successful charge" do
  let(:event_data) do
    event_data = {
      "id"=> "evt_16NUyCKpQyEhIGsiKDBkmRDf",
      "created"=> 1436647992,
      "livemode"=> false,
      "type"=> "charge.succeeded",
      "data"=> {
        "object"=> {
          "id"=> "ch_16NUyCKpQyEhIGsiajQi2kWW",
          "object"=> "charge",
          "created"=> 1436647992,
          "livemode"=> false,
          "paid"=> true,
          "status"=> "succeeded",
          "amount"=> 999,
          "currency"=> "usd",
          "refunded"=> false,
          "source"=> {
            "id"=> "card_16NUyBKpQyEhIGsi4eOrrKJh",
            "object"=> "card",
            "last4"=> "4242",
            "brand"=> "Visa",
            "funding"=> "credit",
            "exp_month"=> 7,
            "exp_year"=> 2016,
            "fingerprint"=> "HBBO0JBqFDkh0W8t",
            "country"=> "US",
            "name"=> nil,
            "address_line1"=> nil,
            "address_line2"=> nil,
            "address_city"=> nil,
            "address_state"=> nil,
            "address_zip"=> nil,
            "address_country"=> nil,
            "cvc_check"=> "pass",
            "address_line1_check"=> nil,
            "address_zip_check"=> nil,
            "tokenization_method"=> nil,
            "dynamic_last4"=> nil,
            "metadata"=> {},
            "customer"=> "cus_6agKepo4dELsUF"
          },
          "captured"=> true,
          "balance_transaction"=> "txn_16NUyCKpQyEhIGsiHdXHvuAr",
          "failure_message"=> nil,
          "failure_code"=> nil,
          "amount_refunded"=> 0,
          "customer"=> "cus_6agKepo4dELsUF",
          "invoice"=> "in_16NUyCKpQyEhIGsifTo22SkA",
          "description"=> nil,
          "dispute"=> nil,
          "metadata"=> {},
          "statement_descriptor"=> "myflix",
          "fraud_details"=> {},
          "receipt_email"=> nil,
          "receipt_number"=> nil,
          "shipping"=> nil,
          "destination"=> nil,
          "application_fee"=> nil,
          "refunds"=> {
            "object"=> "list",
            "total_count"=> 0,
            "has_more"=> false,
            "url"=> "/v1/charges/ch_16NUyCKpQyEhIGsiajQi2kWW/refunds",
            "data"=> []
          }
        }
      },
      "object"=> "event",
      "pending_webhooks"=> 1,
      "request"=> "req_6agK2ZbN4OyNiJ",
      "api_version"=> "2015-06-15"
    }
  end

  it "creates a payment with the webhook from stripe for charge succeeded", :vcr do
    post "/stripe_events", event_data
    expect(Payment.count).to eq(1)
  end

  it "creates the payment associated with the user", :vcr do
    alice = Fabricate(:user, customer_token: "cus_6agKepo4dELsUF")
    post "/stripe_events", event_data
    expect(Payment.first.user).to eq(alice)
  end

  it "creates the payment with the amount", :vcr do
    alice = Fabricate(:user, customer_token: "cus_6agKepo4dELsUF")
    post "/stripe_events", event_data
    expect(Payment.first.amount).to eq(999)
  end

  it "creates the payment with reference id", :vcr do
    alice = Fabricate(:user, customer_token: "cus_6agKepo4dELsUF")
    post "/stripe_events", event_data
    expect(Payment.first.reference_id).to eq("ch_16NUyCKpQyEhIGsiajQi2kWW")
  end

end