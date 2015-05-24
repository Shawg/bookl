# module Ransack
#   module Adapters
#     module ActiveRecord
#       class Context < ::Ransack::Context
#         def evaluate(search, opts = {})
#           viz = Visitor.new
#           relation = @object.where(viz.accept(search.base))
#           if search.sorts.any?
#             _vaccept = viz.accept(search.sorts)
#             table  = _vaccept.first.expr.relation.name
#             column = _vaccept.first.expr.name
#             relation = relation.except(:order).reorder(_vaccept).select("#{@default_table.name}.*, #{table}.#{column}")
#           end
#           opts[:distinct] ? relation.distinct : relation
#         end
#       end
#     end
#   end
# end