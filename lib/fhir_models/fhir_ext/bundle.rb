module FHIR
  class Bundle
    include Enumerable

    def each(&block)
      iteration = entry.map(&:resource).each(&block)
      # TODO: This next line
      # iteration += next_bundle.each(&block) if next_bundle
      iteration
    end

    def next_bundle
      # TODO: test this
      return nil unless client && next_link.try(:url)
      @next_bundle ||= client.parse_reply(self.class, client.default_format, client.raw_read_url(next_link.url))
    end
  end
end
