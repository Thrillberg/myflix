require 'spec_helper'

describe 'Deactivate user on failed charge' do
  let(:event_data) do
    {
      "id"=> "evt_16O7GgKpQyEhIGsibCg5HT1m",
      "created"=> 1436795210,
      "livemode"=> false,
      "type"=> "charge.failed",
      "data"=> {
        "object"=> {
          "id"=> "ch_16O7GgKpQyEhIGsiZcYLwWnJ",
          "object"=> "charge",
          "created"=> 1436795210,
          "livemode"=> false,
          "paid"=> false,
          "status"=> "failed",
          "amount"=> 999,
          "currency"=> "usd",
          "refunded"=> false,
          "source"=> {
            "id"=> "card_16O7FUKpQyEhIGsi5D8kQSXi",
            "object"=> "card",
            "last4"=> "0341",
            "brand"=> "Visa",
            "funding"=> "credit",
            "exp_month"=> 7,
            "exp_year"=> 2017,
            "fingerprint"=> "QbBTImQzSIlj7gJz",
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
            "customer"=> "cus_6awxvdWzw9DpMA"
          },
          "captured"=> false,
          "balance_transaction"=> nil,
          "failure_message"=> "Your card was declined.",
          "failure_code"=> "card_declined",
          "amount_refunded"=> 0,
          "customer"=> "cus_6awxvdWzw9DpMA",
          "invoice"=> nil,
          "description"=> "failing payment",
          "dispute"=> nil,
          "metadata"=> {},
          "statement_descriptor"=> nil,
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
            "url"=> "/v1/charges/ch_16O7GgKpQyEhIGsiZcYLwWnJ/refunds",
            "data"=> []
          }
        }
      },
      "object"=> "event",
      "pending_webhooks"=> 1,
      "request"=> "req_6bJu6Vevm6fSJC",
      "api_version"=> "2015-06-15"
    }
  end

  it "deactivates a user with the webhook data from stripe for a charge failed", :vcr do
    alice = Fabricate(:user, customer_token: "cus_6awxvdWzw9DpMA")
    post "/stripe_events", event_data
    expect(alice.reload).not_to be_active
  end
end