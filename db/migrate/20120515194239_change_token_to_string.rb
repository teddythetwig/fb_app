class ChangeTokenToString < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.change :token, :string
    end
  end

  def down
  end
end
