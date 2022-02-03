class AllInvoicesQuery
  attr_reader :invoices

  def initialize(invoices = Invoice.all)
    @invoices = invoices
  end

  def call(params = {})
    scope = invoices
    scope = by_user_id(scope, params[:user_id])
    scope = by_organisation_id(scope, params[:organisation_id])
    scope = search(scope, params[:search])
    scope = sort_column(scope, params[:sort], params[:direction])
  end

  private

  def by_user_id(scope, user_id = nil)
    user_id ? scope.where(user_id: user_id) : scope
  end

  def by_organisation_id(scope, user_id = nil)
    user_id ? scope.where(user_id: user_id) : scope
  end

  def search(scope, query = nil)
    query ? scope.search(query) : scope
  end

  def sort_column(scope, sort, direction)
    sort_column = sort || 'created_at'
    sort_direction = %w[asc desc].include?(direction) ? direction : 'desc'
    scope.reorder(sort_column =>  sort_direction)
  end
end
