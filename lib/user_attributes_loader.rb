  # @deprecated   This code is unused / no longer useful.  It will be removed no later than release 6.x
  # This middleware is for use in development mode, when User
  # is removed/reloaded each request. This makes sure modules
  # stay loaded.
  class UserAttributesLoader
    def initialize(app)
      ActiveSupport::Deprecation.warn("UserAttributesLoader has been deprecated; it will be removed no later than release 6.")
      @app = app
    end

    def call(env)
      User.class_eval do
        unless ancestors.include?(Hydra::GenericUserAttributes)
          include Hydra::GenericUserAttributes
        end
      end
      @app.call(env)
    end
  end
