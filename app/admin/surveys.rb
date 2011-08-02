ActiveAdmin.register Survey do
  
  show  do
    attributes_table :id, :name, :created_at
    
    panel "Questions" do
      table_for(survey.questions) do |t|
        t.column("Position") { |item| item.position }
        t.column("Content") { |item| item.content }
      end
    end
  end

  form do |f|
    f.inputs "Survey" do
      f.input :name
    end
    
    f.inputs "Questions" do
      f.fields_for :questions do |qf|
# #1 uncomment and render fails 
#        qf.hidden :_destroy
        qf.input :content
              
# #2 uncomment and only position field is rendered
#        qf.input :position
      end
    end
    
# #3 ambre from form dsl?
#    div :id => "end_of_fields"
    
    f.buttons
  end
end
