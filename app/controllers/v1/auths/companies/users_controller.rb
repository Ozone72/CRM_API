class V1::Auths::Companies::UsersController < V1::Auth::CompaniesController

    def create
        @user = User.new(user_params)
        @auth = @user.build_auth(auth_params)
        if @auth.save
            json_response(@auth.token.to_json, :created)
        else
            json_response(@auth.errors.full_messages, :errors)
        end
    end

    private

    def user_params
        params.permit(:first_name, :last_name, :email, :phone, :dob)
    end

    def auth_params
        params.permit(:password, :password_confirmation)
    end
end
