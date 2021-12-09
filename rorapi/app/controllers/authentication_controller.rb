class AuthenticationController < ApplicationController
    def authenticate
        command = AuthenticateUser.call(params[:email], params[:password])

        if command.success?
            render json: { token: command.result,email: params[:email] }
        else
            render json: { error: command.errors }, status: :unauthorized
        end
    end
end
