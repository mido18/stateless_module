module StatelessModule
  class << self
    def included(base)
      base.send(:extend, base)

      freeze_when_module_completes(base)

      base.class_eval do
        class << self
          def included(base)
            raise "#{self.name} is a Stateless Module. " \
                  "Don't include it elsewhere."
          end

          def extended(base)
            raise "#{self.name} is a Stateless Module. " \
                  "Don't extend it elsewhere."
          end
        end
      end
    end

    def extended(base)
      raise "Use Stateless Module by including it - not by extending it."
    end

    #######
    private
    #######

    def freeze_when_module_completes(base)
      TracePoint.trace(:end) do |t|
        if base == t.self
          base.freeze

          base.instance_variables.each do |v|
            base.instance_variable_get(v).freeze
          end

          base.class_variables.each do |v|
            base.class_variable_get(v).freeze
          end

          t.disable
        end
      end
    end

  end
end

class Module
  def stateless_module
    include StatelessModule
  end
end

