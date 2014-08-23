module UeditorRails
  module Helpers
    module FormHelper
      extend ActiveSupport::Concern

      include ActionView::Helpers::TagHelper
      include ActionView::Helpers::JavaScriptHelper

      def ueditor_text(object_name, method = nil, options = {})

        # RAILS_4
        # instance_tag = ActionView::Base::InstanceTag.new(object_name, method, self, options.delete(:object))

        instance_tag = ActionView::Base::Tags::TextArea.new(object_name, method, self, options)
        instance_tag.content_tag(object_name, method, options)
        instance_tag.send(:add_default_name_and_id, options) if options[:id].blank?

        element_id = options.delete('id')
        element_name = options.delete('name')

        element_value = instance_tag.object.send(method)

        ue_tag_attributes = {:type => 'text/plain', :id => element_id, :name => element_name}
        options[:initialFrameWidth] = options.delete(:width) unless options[:width].blank?
        options[:initialFrameHeight] = options.delete(:height) unless options[:height].blank?

        output_buffer = ActiveSupport::SafeBuffer.new

        # RAILS_4
        #output_buffer << instance_tag.to_content_tag(:script, ue_tag_attributes)

        output_buffer << instance_tag.text_area_tag(element_name, element_value, options)
        output_buffer << javascript_tag {Util.js_replace(element_id, options.stringify_keys)}
        output_buffer
      end
    end
  end
end
