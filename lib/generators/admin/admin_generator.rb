class AdminGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def create_admin
    puts "hello world"
    # class_path = "admin"
    #   generate("scaffold_controller", "spot")
    # models.each do |model|
    #   class_path = "admin"
    #   generate("scaffold_controller", "admin/#{model}")
    # end
  end

  private
  def models
    Rails.application.eager_load!
    ActiveRecord::Base.descendants.collect(&:name)
  end
end
