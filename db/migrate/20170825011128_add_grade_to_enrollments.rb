class AddGradeToEnrollments < ActiveRecord::Migration[5.0]
  def change
    add_column :enrollments, :grade, :float, :default => 0.0
  end
end
