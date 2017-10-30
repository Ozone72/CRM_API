class V1::AuthsController < ApplicationController
    skip_before_action :require_login, only: [:create], raise: false

    def create
        if user = User.valid_login?(params[:email], params[:password])
            allow_token_to_be_used_only_once_for(user)
            send_auth_token_for_valid_login_of(user)
        else
            render_unauthorized("Error with your login or password")
        end
    end

    def destroy
        logout
        head :ok
    end

    private

    def send_auth_token_for_valid_login_of(user)
        render json: { token: user.auth.token }
    end

    def allow_token_to_be_used_only_once_for(user)
        user.auth.regenerate_token
    end

    def logout
        current_user.auth.invalidate_token
    end

    def render_unauthorized(message)
        errors = { errors: [ { detail: message } ] }
        render json: errors, status: :unauthorized
    end
end
