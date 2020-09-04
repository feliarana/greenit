ActiveAdmin.register Answer do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :text, :answer_kind, :question_id, :user_id

  index do
    column :id
    column :text
    column :question
    column :user
    column :created_at
    column :updated_at
  end

  form do |f|
    f.inputs do
      f.input :question
      f.input :user, label_method: :email
      f.input :text
      # f.input :answer_kind
    end
    f.actions
  end
end
