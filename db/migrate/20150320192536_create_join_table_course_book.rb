class CreateJoinTableCourseBook < ActiveRecord::Migration
  def change
    create_join_table :courses, :books do |t|
      # t.index [:course_id, :book_id]
      # t.index [:book_id, :course_id]
    end
  end
end
