require 'addressable/uri'

module FHIR
  # Helper module to parse the nuiances of FHIR URLs.
  # Requires an 'iss' attribute populated with an Addressable::URI.
  module URIHelper
    def resource_url(resource_class, params = {})
      params = params.with_indifferent_access
      id = params.delete(:id)
      iss.merge(
        path: resource_path(resource_class, id, params),
        query: resource_params(params)
      )
    end

    private

    def resource_path(resource_class, id, params)
      suffixes = []
      prefixes = []
      suffixes << '_search' if params.fetch(:search, {}).fetch(:flag, false)
      suffixes << '_history' if params.fetch(:history, false)
      suffixes << '$validate' if params.fetch(:validate, false)
      suffixes << params.fetch(:history, {}).fetch(:id, nil)
      prefixes << params.fetch(:search, {}).fetch(:compartment, nil)
      base_path = iss.path.chomp('/')
      [base_path, prefixes, resource_class.name.demodulize, id, suffixes].flatten.compact.join('/')
    end

    def resource_params(params = {})
      params.merge!(params.fetch(:search, {}).fetch(:parameters, {}))
      params[:_count] = params[:history][:count] if params[:_count].blank? && params[:history] && params[:history][:count]
      params[:_since] = params[:history][:since].iso8601 if params[:_since].blank? && params[:history] && params[:history][:since]
      params[:_summary] = params.delete(:summary) unless params[:summary].nil?
      params[:_format] = params.delete(:format) || accept_type if use_format_param?
      params.except!(:search, :history, :format, :validate)
      return if params.empty?
      (iss.query_values || {}).merge(params).to_query
    end
  end
end
