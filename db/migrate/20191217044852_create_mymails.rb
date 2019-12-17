class CreateMymails < ActiveRecord::Migration[5.2]
  def change
    create_table :mymails do |t|
      t.string :email
      t.datetime :expired

      t.timestamps
    end
  end
end
