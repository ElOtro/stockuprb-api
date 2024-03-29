module Queries
  class Invoices
    attr_reader :invoices

    def initialize(invoices = Invoice.all)
      @invoices = invoices
    end

    def call(params = {})
      scope = invoices
      scope = by_user_id(scope, params[:user_id])
      scope = by_organisation_id(scope, params[:organisation_id])
      scope = by_company_id(scope, params[:company_id])
      scope = search(scope, params[:search])
      scope = sort_column(scope, params[:sort], params[:direction])
      scope = scope.page(params[:page]).per(params[:limit])
    end

    private

    def by_user_id(scope, user_id = nil)
      user_id ? scope.where(user_id: user_id) : scope
    end

    def by_organisation_id(scope, organisation_id = nil)
      organisation_id ? scope.where(organisation_id: organisation_id) : scope
    end

    def by_company_id(scope, company_id = nil)
      company_id ? scope.where(company_id: company_id) : scope
    end

    def search(scope, query = nil)
      query.present? ? scope.search(query) : scope
    end

    def sort_column(scope, sort, direction)
      sort_column = sort || 'created_at'
      sort_direction = %w[asc desc].include?(direction) ? direction : 'desc'
      scope.reorder(sort_column => sort_direction)
    end
  end
end
