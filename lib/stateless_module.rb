require "stateless_module/version"

module StatelessModule
  def self.included(base)
    base.send(:extend, base)
    base.class_eval do
      def self.included(m,*args, &block)
        raise "#{self.name} is a Stateless Module. Don't include it elsewhere."
      end
    end
  end
end
