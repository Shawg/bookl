class ChangeColumnCourseNumber < ActiveRecord::Migration
  def change
  	rename_column :courses, :courseNumber, :course_number
  	rename_column :books, :ISBN, :isbn

  end
end
