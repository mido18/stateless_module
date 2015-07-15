module StatelessModule
  class << self
    def included(base)
      base.send(:extend, base)

      base.class_eval do
        class << self
          def included(base)
            raise_stateless_module_error
          end

          def extended(base)
            raise_stateless_module_error
          end

          #######
          private
          #######

          def raise_stateless_module_error
            raise "#{self.name} is a Stateless Module. " \
                  "Don't include it elsewhere."
          end
        end
      end
    end

    def extended(base)
      raise "Use Stateless Module by including it - not by extending it."
    end
  end
end
