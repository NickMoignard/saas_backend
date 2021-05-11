# frozen_string_literal: true

module Mutations
    module Users
      # Send reset password token to user
      class ForgotPassword < Mutations::BaseMutation
        description 'Send Reset Password Token to Users email'
        argument :email, String, required: true
        payload_type Boolean
  
        def resolve(email:)
          user = User.find_by(:email => email)
          if !user.nil?
            user.send_confirmation_instructions
            true
          else
            false
          end
        end
      end
    end
  end
  