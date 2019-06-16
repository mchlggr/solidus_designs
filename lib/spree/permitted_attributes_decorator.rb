Spree::PermittedAttributes.module_eval do
  mattr_accessor :design_attributes, :template_attributes, :template_design_attributes

  class_variable_set(:@@design_attributes, [
      :user_id, :medium, :name, :size, :markup, :render_url, :source_id, :template_id, :line_item_id, :virtual_proof
  ])

  class_variable_set(:@@template_attributes, [
      :name, :medium, :display, :tag_list, :popularity
  ])
end