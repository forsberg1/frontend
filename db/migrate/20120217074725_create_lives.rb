class CreateLives < ActiveRecord::Migration
  def change
    create_table :lives do |t|

      t.timestamps
    end
  end
end
