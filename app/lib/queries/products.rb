module Queries
  class Products
    attr_reader :products

    def initialize(products = Product.all)
      @products = products
    end

    def call(params = {})
      scope = products
      scope = search(scope, params[:search])
      scope = sort_column(scope, params[:sort], params[:direction])
      scope = scope.page(params[:page]).per(params[:limit])
    end

    private

    def search(scope, query = '')
      query.present? ? scope.search(query) : scope
    end

    def sort_column(scope, sort, direction)
      sort_column = sort || 'name'
      sort_direction = %w[asc desc].include?(direction) ? direction : 'desc'
      scope.reorder(sort_column => sort_direction)
    end
  end
end
