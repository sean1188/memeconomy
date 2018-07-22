class UpdateUsersAddName < ActiveRecord::Migration[5.2]
  def change
  	change_table :users do |t|
  		t.string :name, null: false, default: ""
  	end
  end
end
