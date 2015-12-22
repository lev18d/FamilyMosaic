class CreateUMessages < ActiveRecord::Migration
  def change
    create_table :u_messages do |t|

      t.timestamps
    end
  end
end
