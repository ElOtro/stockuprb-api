class CreateBankAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :bank_accounts do |t|
      t.references :organisation, null: false, index: true
      t.boolean    :is_default, default: false
      t.integer    :account_type, default: 1
      t.string     :name
      t.jsonb      :details, default: {}
      t.datetime   :destroyed_at, index: true

      t.timestamps
    end
  end
end
