class AdminRouter

  class << self
    def load
      ActiveRecord::Base.connection.tables.map { |x| x.classify.safe_constantize }.compact
    end
  end

end
