class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.references :user
      t.references :group

      t.timestamps
    end

    add_index :memberships, [:user_id, :group_id], unique: true
  end
end
