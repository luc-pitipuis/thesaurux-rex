# This library is for providing common logics related to account operations

class AccountOperation
  class << self
    def get_status(samaccountname)
      {
        samaccountname: samaccountname,
        locked: locked?(samaccountname)
      }.with_indifferent_access
    end

    def locked?(account)
      # TODO: Implement check locked or not
      [true, false].sample  # return true or false randomly
    end
  end
end
