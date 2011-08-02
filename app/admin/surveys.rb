
module ActiveAdmin
  class DSL
    # This removes the filter sidebar (and all default or previously called side bars)
    def clear_sidebars()
      config.clear_sidebar_sections!
    end
  end
end

ActiveAdmin.register Survey do
  
  # config and @config = ActiveAdmin::Resource
  # Rails.logger.info("*** @config = #{@config}")

  # config.resource = Survey Model
  # Rails.logger.info("*** @config.resource = #{@config.resource}")

  # Rails.logger.info("*** config.sidebar_sections = #{config.sidebar_sections}")
  # Rails.logger.info("*** config.member_actions = #{config.member_actions}")

  clear_sidebars
  
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
       qf.input :_destroy, :as => :hidden
       # qf.input :content
              
# #2 uncomment and only position field is rendered
#        qf.input :position
      end
    end
    
# #3 ambre from form dsl?
#    div :id => "end_of_fields"
    
    f.buttons
  end
end
