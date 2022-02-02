class CreateBankAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :bank_accounts, comment: "Bank Accounts of Organisations" do |t|
      t.references :organisation, null: false, index: true, comment: "Organisation"
      t.boolean    :is_default, default: false, comment: "Is default Bank Account of Organisation"
      t.integer    :account_type, default: 1, comment: "Type of Bank Account"
      t.string     :name, comment: "Name of Bank Account"
      t.jsonb      :details, default: {}, comment: "To store additional information"
      t.datetime   :destroyed_at, index: true, comment: "Uses for soft delete"

      t.timestamps
    end
  end
end
