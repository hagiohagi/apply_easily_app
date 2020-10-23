class CreateParttimes < ActiveRecord::Migration[6.0]
  def change
    create_table :parttimes do |t|
      t.references :user,         null: false, foreign_key: true
      t.integer :sun_parttime_in
      t.integer :sun_parttime_out
      t.integer :mon_parttime_in
      t.integer :mon_parttime_out
      t.integer :tue_parttime_in
      t.integer :tue_parttime_out
      t.integer :wed_parttime_in
      t.integer :wed_parttime_out
      t.integer :thu_parttime_in
      t.integer :thu_parttime_out
      t.integer :fri_parttime_in
      t.integer :fri_parttime_out
      t.integer :sat_parttime_in
      t.integer :sat_parttime_out
      t.string :pr_1,             null: false
      t.string :pr_2,             null: false
      t.string :pr_3,             null: false

      t.timestamps
    end
  end
end
