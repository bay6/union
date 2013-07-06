# coding: utf-8

class SetDafaultUserGrade < ActiveRecord::Migration

  def change
    grade = Grade.find_by_name "初级"
    if grade
      User.update_all grade_id: grade.id
    end
  end

end
