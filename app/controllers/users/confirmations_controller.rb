# frozen_string_literal: true

class Users::ConfirmationsController < Devise::ConfirmationsController
  # GET /resource/confirmation/new
  # def new
  # end

  # POST /resource/confirmation
  # def create
  #   super
  # end

  # GET /resource/confirmation?confirmation_token=abcdef
  def show
    self.resource = resource_class.confirm_by_token(params[:confirmation_token])
    yield resource if block_given?

    # メールトークンを受け取り後、プロフィールテンプレートを自動生成
    @user = User.find_by(confirmation_token: params[:confirmation_token])
    Profile.create(user_id: @user.id)

    # if resource.errors.empty?
    #   # set_flash_message!(:notice, :confirmed)
    #   # respond_with_navigational(resource){ redirect_to after_confirmation_path_for(resource_name, resource) }
    # else
    #   respond_with_navigational(resource.errors, status: :unprocessable_entity){ render :new }
    # end
  end

  # protected

  # The path used after resending confirmation instructions.
  # def after_resending_confirmation_instructions_path_for(resource_name)
  #   super(resource_name)
  # end

  # The path used after confirmation.
  # def after_confirmation_path_for(resource_name, resource)
  #   super(resource_name, resource)
  # end
end
