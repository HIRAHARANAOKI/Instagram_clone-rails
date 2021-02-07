
class RegistrationsControlelr < Devise::RegistrationsController

  protected

  def update_resource(resource, params)
    resource.update_without_current_password(params)
  end

  # deviseが用意しているメソッドメソッド。アカウントをアップデートさせた後、どのパスに変異させるかを指定できる
  def after_update_path_for(resource)
    user_path(resource)
  end
end