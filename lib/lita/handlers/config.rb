module Lita::Handlers::IrinaLita
  class Config < Lita::Handler
    namespace "Irina"

    default_term_normalizer = proc do |term|
      term.to_s.downcase.strip
    end

    config :oracle_auth, required: false, type: Hash

     validate do |value|
        t("callable_required") unless value.respond_to?(:call)
      end
    end
  end
end

Lita.register_handler(Lita::Handlers::IrinaLita::Config)