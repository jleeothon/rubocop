# frozen_string_literal: true

module RuboCop
  module Cop
    module Style
      # This cop checks for the use of the send method.
      class Send < Cop
        MSG = 'Prefer `Object#__send__` or `Object#public_send` to ' \
              '`send`.'.freeze

        def_node_matcher :sending?, '(send _ :send ...)'

        def on_send(node)
          return unless sending?(node) && node.arguments?

          add_offense(node, location: :selector)
        end
      end
    end
  end
end
