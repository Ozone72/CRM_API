class ApiSubdomain
    def self.matches? request
        case request.subdomain
        when 'api'
            true
        else
            false
        end
    end
end
