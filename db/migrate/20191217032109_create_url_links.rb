class CreateUrlLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :url_links do |t|
      t.string :url

      t.timestamps
    end
  end
end
